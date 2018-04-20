//-----------------------------------------------------------------------------
// mis603_soc_top.v
//-----------------------------------------------------------------------------

module mis603_soc_top
  (
    RESET,
    CLK,
    LED8_GPIO_IO_O_pin
  );
  input RESET;
  input CLK;
  output [7:0] LED8_GPIO_IO_O_pin;

  (* BOX_TYPE = "user_black_box" *)
  mis603_soc
    mis603_soc_i (
      .RESET ( RESET ),
      .CLK ( CLK ),
      .LED8_GPIO_IO_O_pin ( LED8_GPIO_IO_O_pin )
    );
	 
	// assign LED8_GPIO_IO_O_pin = 8'hAA;

endmodule
