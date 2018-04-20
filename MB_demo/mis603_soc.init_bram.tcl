cd F:/FPGA_Study/MB_demo/MB_demo/mis603_soc
if { [ catch { xload xmp mis603_soc.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
