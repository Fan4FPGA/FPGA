`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:19 01/11/2018 
// Design Name: 
// Module Name:    DRR3_TEST_TOP 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DRR3_TEST_TOP#(
	parameter C3_NUM_DQ_PINS =16,
	parameter C3_MEM_ADDR_WIDTH = 15, 
	parameter C3_MEM_BANKADDR_WIDTH   	= 3,
	parameter C3_P0_MASK_SIZE           = 16,	
	parameter C3_P0_DATA_PORT_SIZE		= 128	
	)
	(
	
	input sys_clk_i,
	input sys_rst_n_i,
	output calib_done,
		
	inout  [C3_NUM_DQ_PINS-1:0]                      mcb3_dram_dq,
   output [C3_MEM_ADDR_WIDTH-1:0]                   mcb3_dram_a,
   output [C3_MEM_BANKADDR_WIDTH-1:0]               mcb3_dram_ba,
   output                                           mcb3_dram_ras_n,
   output                                           mcb3_dram_cas_n,
   output                                           mcb3_dram_we_n,
   output                                           mcb3_dram_odt,
   output                                           mcb3_dram_reset_n,
   output                                           mcb3_dram_cke,
   output                                           mcb3_dram_dm,
   inout                                            mcb3_dram_udqs,
   inout                                            mcb3_dram_udqs_n,
   inout                                            mcb3_rzq,
   inout                                            mcb3_zio,
   output                                           mcb3_dram_udm,
   inout                                            mcb3_dram_dqs,
   inout                                            mcb3_dram_dqs_n,
   output                                           mcb3_dram_ck,
   output                                           mcb3_dram_ck_n
    );
    
    //MCB cmd interface
      wire																c3_p0_cmd_clk;
      wire																c3_p0_cmd_en;
      wire [2:0]													c3_p0_cmd_instr;
      wire [5:0]													c3_p0_cmd_bl;
      wire [29:0]													c3_p0_cmd_byte_addr;
      wire																c3_p0_cmd_empty;			//not use
      wire																c3_p0_cmd_full;				//not use
   //MCB wirte interface   
      wire																c3_p0_wr_clk;
      wire																c3_p0_wr_en;
      wire [C3_P0_DATA_PORT_SIZE/8 - 1:0]	c3_p0_wr_mask;				//not use
      wire [C3_P0_DATA_PORT_SIZE - 1:0]		c3_p0_wr_data;
      wire																c3_p0_wr_full;	
      wire																c3_p0_wr_empty;				//not use
      wire [6:0]													c3_p0_wr_count;				//not use
      wire																c3_p0_wr_underrun;		//not use
      wire																c3_p0_wr_error;				//not use
   //MCB read interface   
      wire																c3_p0_rd_clk;
      wire																c3_p0_rd_en;
      wire [C3_P0_DATA_PORT_SIZE - 1:0]		c3_p0_rd_data;
      wire																c3_p0_rd_full;				//not use
      wire																c3_p0_rd_empty;
      wire [6:0]													c3_p0_rd_count;				//not use
      wire																c3_p0_rd_overflow;		//not use
      wire																c3_p0_rd_error;				//not use
      
      
      wire 																clk;
			wire 																rst_n;
			wire 																u_wr_cmd_done;				//The operation of wirte cmd is done 
			wire 																u_wr_rdy;							//user write ready ,data can be written in to mcb
			
			wire  															u_wr_cmd_en;					//user write mcb cmd enable
			wire  															u_wr_en;							//user write data enable
			wire  [127:0] 											u_wr_data;						//user write data
			wire  [29:0]												u_wr_addr;						//user write address			
			wire  [6:0] 												u_wr_len;							//user write data len
      
      
//    wire 																clk,
//		wire 																rst_n,
			wire 																u_rd_cmd_done;
			wire 																u_rd_rdy;
			wire [127:0]												u_rd_data;	
			
			wire 																u_rd_cmd_en;
			wire 																u_rd_en;
			wire [29:0] 												u_rd_addr;
			wire [6:0] 													u_rd_len;
		 
			wire 																clk_ddr;							//pll base clk out	
			wire 																clk_50m;
			wire 																clk_100m;
		  wire  															calc_done;						//watchdog for ddr calic
		  wire 																rst_ddr_n;
			
			(*KEEP = "TRUE" *)  wire c3_calib_done;
			assign calib_done = ~(c3_calib_done);
			wire 	 calib_rst;
			assign calib_rst=c3_calib_done;//
			

//---------------------------------------------------------------------------------------------------------------------- 			
      clk_rst_gen #(
   		.WDOG_CALC_INIT_WIDTH(26)  //= 26
			)
			u_pll(
													//system extern clk and rst in
		  .sys_clk(sys_clk_i),
			.sys_rst_n(sys_rst_n_i),
													//pll base clk out	 
		  .clk_ddr(clk_ddr),
		  .clk_50m(clk_50m),
		  .clk_100m(clk_100m),
													//watchdog for ddr calic
		  .calc_done(calib_rst),
		  .rst_ddr_n(rst_ddr_n)
    ); 
 
//----------------------------------------------------------------------------------------------------------------------    
	//		wire [29:0] u_wr_addr_w;
//      U_MCB_WR U_MCB_WR_inst(
//			 .clk(clk_100m),
//			 .rst_n(rst_ddr_n),
//			 .u_wr_cmd_done(u_wr_cmd_done),		//The operation of wirte cmd is done 
//			 .u_wr_rdy(u_wr_rdy),					//user write ready ,data can be written in to mcb
//			 
//			 .u_wr_cmd_en(u_wr_cmd_en),			//user write mcb cmd enable
//			 .u_wr_en(u_wr_en),					//user write data enable
//			 .u_wr_data(u_wr_data),				//user write data
//			 .u_wr_addr(u_wr_addr),				//user write address
//			 .u_wr_len(u_wr_len)					//user write data len
//    );
    
//----------------------------------------------------------------------------------------------------------------------     
    
//    U_MCB_RD U_MCB_RD_inst(
//			 .clk(clk_100m),
//			 .rst_n(rst_ddr_n),
//			 .u_rd_cmd_done(u_rd_cmd_done),
//			 .u_rd_rdy(u_rd_rdy),
//			 .u_rd_data(u_rd_data),	
//			 
//			 .u_rd_cmd_en(u_rd_cmd_en),
//			 .u_rd_en(u_rd_en),
//			 .u_rd_addr(u_rd_addr),
//			 .u_rd_len(u_rd_len)
//    );
//   
    
//----------------------------------------------------------------------------------------------------------------------    
    
     DDR3_User_Design #(.MCB_DATA_WIDTH(128))
		 DDR3_User_Design_inst(
		//Clk and Reset
			 .clk(clk_100m), //must same as ddr fifo write and read    
			 .rst_n(~calib_done),
		//MCB cmd interface
    	.c3_p0_cmd_clk(clk_100m),
    	.c3_p0_cmd_en(c3_p0_cmd_en),
    	.c3_p0_cmd_instr(c3_p0_cmd_instr),
    	.c3_p0_cmd_bl(c3_p0_cmd_bl),
    	.c3_p0_cmd_byte_addr(c3_p0_cmd_byte_addr),
    	.c3_p0_cmd_empty(c3_p0_cmd_empty),											//not use
    	.c3_p0_cmd_full(c3_p0_cmd_full),												//not use
   //MCB wirte interface   
     	.c3_p0_wr_clk(clk_100m),
     	.c3_p0_wr_en(c3_p0_wr_en),
     	.c3_p0_wr_mask(c3_p0_wr_mask),				//not use
     	.c3_p0_wr_data(c3_p0_wr_data),
     	.c3_p0_wr_full(c3_p0_wr_full),	
     	.c3_p0_wr_empty(c3_p0_wr_empty),				//not use
     	.c3_p0_wr_count(c3_p0_wr_count),				//not use
     	.c3_p0_wr_underrun(c3_p0_wr_underrun),		//not use
     	.c3_p0_wr_error(c3_p0_wr_error),				//not use
   //MCB read interface   
     	.c3_p0_rd_clk(clk_100m),
     	.c3_p0_rd_en(c3_p0_rd_en),
     	.c3_p0_rd_data(c3_p0_rd_data),
     	.c3_p0_rd_full(c3_p0_rd_full),				//not use
     	.c3_p0_rd_empty(c3_p0_rd_empty),
     	.c3_p0_rd_count(c3_p0_rd_count),				//not use
     	.c3_p0_rd_overflow(c3_p0_rd_overflow),		//not use
     	.c3_p0_rd_error(c3_p0_rd_error),			//not use
      
   //User interface   
   //User write interface
   
    	.u_wr_len(u_wr_len),
    	.u_wr_addr(u_wr_addr),
     	.u_wr_data(u_wr_data),
    	.u_wr_en(u_wr_en),
    	.u_wr_cmd_en(u_wr_cmd_en),
    	.u_wr_cmd_done(u_wr_cmd_done),
    	.u_wr_rdy(u_wr_rdy),
   
   //User read interface
   
	  	.u_rd_len(u_rd_len),
	  	.u_rd_addr(u_rd_addr),
	    .u_rd_data(u_rd_data),
	  	.u_rd_en(u_rd_en),
	  	.u_rd_cmd_en(u_rd_cmd_en),
	  	.u_rd_cmd_done(u_rd_cmd_done),
	  	.u_rd_rdy(u_rd_rdy)
    
    );
    
//----------------------------------------------------------------------------------------------------------------------    
    MI603 #
		(
	   .C3_P0_MASK_SIZE(16),          	//= 16,
	   .C3_P0_DATA_PORT_SIZE(128),      	//= 128,
	   .DEBUG_EN(0),                	 	//= 0,       
	                             			// # = 1, Enable debug signals/controls,
	                             			//= 0, Disable debug signals/controls.
	   .C3_MEMCLK_PERIOD(2500),         	//= 3000,       
	                            			// Memory data transfer clock period
	   .C3_CALIB_SOFT_IP("TRUE"),         	//= "TRUE",       
	                             			// # = TRUE, Enables the soft calibration logic,
	                             			// # = FALSE, Disables the soft calibration logic.
	   .C3_SIMULATION("FALSE"),            	//= "FALSE",       
	                             			// # = TRUE, Simulating the design. Useful to reduce the simulation time,
	                             			// # = FALSE, Implementing the design.
	   .C3_RST_ACT_LOW(0),           	//= 0,       
	                            			// # = 1 for active low reset,
	                            			// # = 0 for active high reset.
	   .C3_INPUT_CLK_TYPE("SINGLE_ENDED"),       		//= "SINGLE_ENDED",       
	                             			// input clock type DIFFERENTIAL or SINGLE_ENDED
	   .C3_MEM_ADDR_ORDER("ROW_BANK_COLUMN"),       	 	//= "ROW_BANK_COLUMN",       
	                             			// The order in which user address is provided to the memory controller,
	                             			// ROW_BANK_COLUMN or BANK_ROW_COLUMN
	   .C3_NUM_DQ_PINS(16),          		//= 16,       
	                             			// External memory data width
	   .C3_MEM_ADDR_WIDTH(15),        	//= 14,       
	                             			// External memory address width
	   .C3_MEM_BANKADDR_WIDTH(3)    	//= 3        
	                                  // External memory bank address width
		)	
	u_ddr3_mig
(
     .mcb3_dram_dq(mcb3_dram_dq),
     .mcb3_dram_a(mcb3_dram_a),
     .mcb3_dram_ba(mcb3_dram_ba),
     .mcb3_dram_ras_n(mcb3_dram_ras_n),
     .mcb3_dram_cas_n(mcb3_dram_cas_n),
     .mcb3_dram_we_n(mcb3_dram_we_n),
     .mcb3_dram_odt(mcb3_dram_odt),
     .mcb3_dram_reset_n(mcb3_dram_reset_n),
     .mcb3_dram_cke(mcb3_dram_cke),
     .mcb3_dram_dm(mcb3_dram_dm),
     .mcb3_dram_udqs(mcb3_dram_udqs),
     .mcb3_dram_udqs_n(mcb3_dram_udqs_n),
     .mcb3_rzq(mcb3_rzq),
     .mcb3_zio(mcb3_zio),
     .mcb3_dram_udm(mcb3_dram_udm),
     .mcb3_dram_dqs(mcb3_dram_dqs),
     .mcb3_dram_dqs_n(mcb3_dram_dqs_n),
     .mcb3_dram_ck(mcb3_dram_ck),
     .mcb3_dram_ck_n(mcb3_dram_ck_n),
     
     .c3_sys_clk(clk_ddr),
     .c3_sys_rst_i(~rst_ddr_n),
     .c3_calib_done(c3_calib_done),
     .c3_clk0(c3_clk0),
     .c3_rst0(c3_clk0),

     .c3_p0_cmd_clk(c3_p0_cmd_clk),
     .c3_p0_cmd_en(c3_p0_cmd_en),
     .c3_p0_cmd_instr(c3_p0_cmd_instr),
     .c3_p0_cmd_bl(c3_p0_cmd_bl),
     .c3_p0_cmd_byte_addr(c3_p0_cmd_byte_addr),
     .c3_p0_cmd_empty(c3_p0_cmd_empty),
     .c3_p0_cmd_full(c3_p0_cmd_full),
     
     .c3_p0_wr_clk(c3_p0_wr_clk),
     .c3_p0_wr_en(c3_p0_wr_en),
     .c3_p0_wr_mask(c3_p0_wr_mask),
     .c3_p0_wr_data(c3_p0_wr_data),
     .c3_p0_wr_full(c3_p0_wr_full),
     .c3_p0_wr_empty(c3_p0_wr_empty),
     .c3_p0_wr_count(c3_p0_wr_count),
     .c3_p0_wr_underrun(c3_p0_wr_underrun),
     .c3_p0_wr_error(c3_p0_wr_error),
     
     .c3_p0_rd_clk(c3_p0_rd_clk),
     .c3_p0_rd_en(c3_p0_rd_en),
     .c3_p0_rd_data(c3_p0_rd_data),
     .c3_p0_rd_full(c3_p0_rd_full),
     .c3_p0_rd_empty(c3_p0_rd_empty),
     .c3_p0_rd_count(c3_p0_rd_count),
     .c3_p0_rd_overflow(c3_p0_rd_count),
     .c3_p0_rd_error(c3_p0_rd_error)
);



endmodule
