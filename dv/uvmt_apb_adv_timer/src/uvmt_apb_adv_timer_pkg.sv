// Copyright 2022 Datum Technology Corporation
// Copyright 2022 Low Power Futures
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVMT_APB_ADV_TIMER_PKG_SV__
`define __UVMT_APB_ADV_TIMER_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_macros.svh"
`include "uvml_logs_macros.svh"
`include "uvma_clk_macros.svh"
`include "uvma_reset_macros.svh"
`include "uvma_apb_macros.svh"
`include "uvme_apb_adv_timer_macros.svh"
`include "uvmt_apb_adv_timer_macros.svh"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s)
`include "uvmt_apb_adv_timer_probe_if.sv"


/**
 * Encapsulates all the types of the APB Advanced Timer Sub-System UVM Test Bench.
 */
package uvmt_apb_adv_timer_pkg;

   import uvm_pkg               ::*;
   import uvml_pkg              ::*;
   import uvml_logs_pkg         ::*;
   import uvml_sb_pkg           ::*;
   import uvml_ral_pkg          ::*;
   import uvma_clk_pkg          ::*;
   import uvma_reset_pkg        ::*;
   import uvma_apb_pkg          ::*;
   import uvme_apb_adv_timer_pkg::*;

   // Constants / Structs / Enums
   `include "uvmt_apb_adv_timer_tdefs.sv"
   `include "uvmt_apb_adv_timer_constants.sv"

   // Base tests
   `include "uvmt_apb_adv_timer_test_cfg.sv"
   `include "uvmt_apb_adv_timer_base_test.sv"
   `include "uvmt_apb_adv_timer_reg_base_test.sv"

   // Functional tests
   `include "uvmt_apb_adv_timer_smoke_test.sv"
   `include "uvmt_apb_adv_timer_reg_hw_reset_test.sv"
   `include "uvmt_apb_adv_timer_reg_bit_bash_test.sv"

endpackage : uvmt_apb_adv_timer_pkg


// Module(s) / Checker(s)
`include "uvmt_apb_adv_timer_dut_wrap.sv"
`include "uvmt_apb_adv_timer_dut_chkr.sv"
`include "uvmt_apb_adv_timer_tb.sv"


`endif // __UVMT_APB_ADV_TIMER_PKG_SV__
