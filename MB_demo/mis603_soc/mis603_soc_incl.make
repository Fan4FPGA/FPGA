#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:F:\FPGA_Study\MB_demo\MB_demo\mis603_soc\mis603_soc.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

SHELL = CMD

XILINX_EDK_DIR = D:/Xilinx/14.7/ISE_DS/EDK

SYSTEM = mis603_soc

MHSFILE = mis603_soc.mhs

FPGA_ARCH = spartan6

DEVICE = xc6slx16ftg256-2

INTSTYLE = ise

XPS_HDL_LANG = verilog
GLOBAL_SEARCHPATHOPT = 
PROJECT_SEARCHPATHOPT = 

SEARCHPATHOPT = $(PROJECT_SEARCHPATHOPT) $(GLOBAL_SEARCHPATHOPT)

SUBMODULE_OPT =  -toplevel no -ti mis603_soc_i

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(XPS_HDL_LANG) -intstyle $(INTSTYLE) $(SEARCHPATHOPT) $(SUBMODULE_OPT) -msg __xps/ise/xmsgprops.lst

OBSERVE_PAR_OPTIONS = -error yes

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
MICROBLAZE_BOOTLOOP_LE = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop_le.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

MICROBLAZE_0_BOOTLOOP = $(BOOTLOOP_DIR)/microblaze_0.elf

BRAMINIT_ELF_IMP_FILES = $(MICROBLAZE_0_BOOTLOOP)
BRAMINIT_ELF_IMP_FILE_ARGS = -pe microblaze_0 $(MICROBLAZE_0_BOOTLOOP)

BRAMINIT_ELF_SIM_FILES = $(MICROBLAZE_0_BOOTLOOP)
BRAMINIT_ELF_SIM_FILE_ARGS = -pe microblaze_0 $(MICROBLAZE_0_BOOTLOOP)

SIM_CMD = isim_mis603_soc

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.tcl

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.tcl

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.tcl

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(XPS_HDL_LANG) -intstyle $(INTSTYLE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_SIM_FILE_ARGS) -msg __xps/ise/xmsgprops.lst -s isim -X F:/FPGA_Study/MB_demo/MB_demo/mis603_soc/


CORE_STATE_DEVELOPMENT_FILES = 

WRAPPER_NGC_FILES = implementation/mis603_soc_proc_sys_reset_0_wrapper.ngc \
implementation/mis603_soc_microblaze_0_ilmb_wrapper.ngc \
implementation/mis603_soc_microblaze_0_i_bram_ctrl_wrapper.ngc \
implementation/mis603_soc_microblaze_0_dlmb_wrapper.ngc \
implementation/mis603_soc_microblaze_0_d_bram_ctrl_wrapper.ngc \
implementation/mis603_soc_microblaze_0_bram_block_wrapper.ngc \
implementation/mis603_soc_microblaze_0_wrapper.ngc \
implementation/mis603_soc_debug_module_wrapper.ngc \
implementation/mis603_soc_clock_generator_0_wrapper.ngc \
implementation/mis603_soc_axi4lite_0_wrapper.ngc \
implementation/mis603_soc_led8_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data\mis603_soc.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

SDK_EXPORT_DIR = SDK\SDK_Export\hw
SYSTEM_HW_HANDOFF = $(SDK_EXPORT_DIR)/$(SYSTEM).xml
SYSTEM_HW_HANDOFF_BIT = $(SDK_EXPORT_DIR)/$(SYSTEM).bit
SYSTEM_HW_HANDOFF_BMM = $(SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
SYSTEM_HW_HANDOFF_DEP = $(SYSTEM_HW_HANDOFF)
