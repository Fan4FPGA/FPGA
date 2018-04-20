cd F:/FPGA_Study/MB_demo/MB_demo/mis603_soc/
if { [ catch { xload xmp mis603_soc.xmp } result ] } {
  exit 10
}
xset hdl verilog
run stubgen
exit 0
