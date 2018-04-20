proc pnsynth {} {
  cd F:/FPGA_Study/MB_demo/MB_demo/mis603_soc
  if { [ catch { xload xmp mis603_soc.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
