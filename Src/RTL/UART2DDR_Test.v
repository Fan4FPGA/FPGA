module UART2DDR3_Test#
(		
	parameter C3_NUM_DQ_PINS			= 16,
	parameter C3_MEM_ADDR_WIDTH       	= 15,  
	parameter C3_MEM_BANKADDR_WIDTH   	= 3,
	parameter C3_P0_MASK_SIZE           = 16,	
	parameter C3_P0_DATA_PORT_SIZE		= 128	
 )
(
	input 	sys_rst_i,
	input 	sys_clk_i,
////////UART Interface///////////////////////////
	output 	uart_tx_o,
	input 	uart_rx_i,
////////DDR3 Interface///////////////////////////////////   
   output   calib_done,	
// output                                           error,
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





















endmodule
