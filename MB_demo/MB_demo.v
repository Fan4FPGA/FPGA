`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:35 04/20/2018 
// Design Name: 
// Module Name:    MB_demo 
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
`timescale 1ns / 1ps
module MB_demo(
input CLK,
input RESET
);
(* BOX_TYPE = "user_black_box" *)
mis603_soc mis603_soc_u
(
.RESET (RESET),
.CLK(CLK)
);
endmodule
