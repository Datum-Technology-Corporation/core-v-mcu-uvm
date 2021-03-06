// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_APB_TIMER_REG_BLOCK_SV__
`define __UVME_APB_TIMER_REG_BLOCK_SV__


`include "uvme_apb_timer_cfg_reg_low_reg.sv"
`include "uvme_apb_timer_cfg_reg_hi_reg.sv"
`include "uvme_apb_timer_timer_val_lo_reg.sv"
`include "uvme_apb_timer_timer_val_hi_reg.sv"
`include "uvme_apb_timer_timer_cmp_lo_reg.sv"
`include "uvme_apb_timer_timer_cmp_hi_reg.sv"
`include "uvme_apb_timer_timer_start_lo_reg.sv"
`include "uvme_apb_timer_timer_start_hi_reg.sv"
`include "uvme_apb_timer_timer_reset_lo_reg.sv"
`include "uvme_apb_timer_timer_reset_hi_reg.sv"


class uvme_apb_timer_reg_block_c extends uvml_ral_reg_block_c;
   
   // Objects
   uvme_apb_timer_cfg_c    cfg;
   uvme_apb_timer_cntxt_c  cntxt;
   
   // Registers
  rand uvme_apb_timer_cfg_reg_low_reg_c  cfg_reg_low;
  rand uvme_apb_timer_cfg_reg_hi_reg_c  cfg_reg_hi;
  rand uvme_apb_timer_timer_val_lo_reg_c  timer_val_lo;
  rand uvme_apb_timer_timer_val_hi_reg_c  timer_val_hi;
  rand uvme_apb_timer_timer_cmp_lo_reg_c  timer_cmp_lo;
  rand uvme_apb_timer_timer_cmp_hi_reg_c  timer_cmp_hi;
  rand uvme_apb_timer_timer_start_lo_reg_c  timer_start_lo;
  rand uvme_apb_timer_timer_start_hi_reg_c  timer_start_hi;
  rand uvme_apb_timer_timer_reset_lo_reg_c  timer_reset_lo;
  rand uvme_apb_timer_timer_reset_hi_reg_c  timer_reset_hi;
   
   
   `uvm_object_utils_begin(uvme_apb_timer_reg_block_c)
      `uvm_field_object(cfg_reg_low, UVM_DEFAULT)
      `uvm_field_object(cfg_reg_hi, UVM_DEFAULT)
      `uvm_field_object(timer_val_lo, UVM_DEFAULT)
      `uvm_field_object(timer_val_hi, UVM_DEFAULT)
      `uvm_field_object(timer_cmp_lo, UVM_DEFAULT)
      `uvm_field_object(timer_cmp_hi, UVM_DEFAULT)
      `uvm_field_object(timer_start_lo, UVM_DEFAULT)
      `uvm_field_object(timer_start_hi, UVM_DEFAULT)
      `uvm_field_object(timer_reset_lo, UVM_DEFAULT)
      `uvm_field_object(timer_reset_hi, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_reg_block");
   
   /**
    * Creates register(s).
    */
   extern virtual function void create_regs();
   
   /**
    * Creates default register map.
    */
   extern virtual function void create_reg_map();
   
   /**
    * Adds register(s) to register map.
    */
   extern virtual function void add_regs_to_map();
   
endclass : uvme_apb_timer_reg_block_c


function uvme_apb_timer_reg_block_c::new(string name="uvme_apb_timer_reg_block");
   
   super.new(name, UVM_NO_COVERAGE);
   
endfunction : new


function void uvme_apb_timer_reg_block_c::create_regs();
   
   cfg_reg_low = uvme_apb_timer_cfg_reg_low_reg_c::type_id::create("cfg_reg_low");
   cfg_reg_low.configure(this);
   cfg_reg_low.build();
   
   cfg_reg_hi = uvme_apb_timer_cfg_reg_hi_reg_c::type_id::create("cfg_reg_hi");
   cfg_reg_hi.configure(this);
   cfg_reg_hi.build();
   
   timer_val_lo = uvme_apb_timer_timer_val_lo_reg_c::type_id::create("timer_val_lo");
   timer_val_lo.configure(this);
   timer_val_lo.build();
   
   timer_val_hi = uvme_apb_timer_timer_val_hi_reg_c::type_id::create("timer_val_hi");
   timer_val_hi.configure(this);
   timer_val_hi.build();
   
   timer_cmp_lo = uvme_apb_timer_timer_cmp_lo_reg_c::type_id::create("timer_cmp_lo");
   timer_cmp_lo.configure(this);
   timer_cmp_lo.build();
   
   timer_cmp_hi = uvme_apb_timer_timer_cmp_hi_reg_c::type_id::create("timer_cmp_hi");
   timer_cmp_hi.configure(this);
   timer_cmp_hi.build();
   
   timer_start_lo = uvme_apb_timer_timer_start_lo_reg_c::type_id::create("timer_start_lo");
   timer_start_lo.configure(this);
   timer_start_lo.build();
   
   timer_start_hi = uvme_apb_timer_timer_start_hi_reg_c::type_id::create("timer_start_hi");
   timer_start_hi.configure(this);
   timer_start_hi.build();
   
   timer_reset_lo = uvme_apb_timer_timer_reset_lo_reg_c::type_id::create("timer_reset_lo");
   timer_reset_lo.configure(this);
   timer_reset_lo.build();
   
   timer_reset_hi = uvme_apb_timer_timer_reset_hi_reg_c::type_id::create("timer_reset_hi");
   timer_reset_hi.configure(this);
   timer_reset_hi.build();
   
endfunction : create_regs


function void uvme_apb_timer_reg_block_c::create_reg_map();
   
   // Create default register map (default_map)
   default_map = create_map(
      .name     ("default_map"),
      .base_addr(32'h1A10_B000),
      .n_bytes  (4),
      .endian   (UVM_LITTLE_ENDIAN)
   );
   
endfunction : create_reg_map


function void uvme_apb_timer_reg_block_c::add_regs_to_map();
   
   default_map.add_reg(
      .rg    (cfg_reg_low),
      .offset(32'h000),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (cfg_reg_hi),
      .offset(32'h004),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_val_lo),
      .offset(32'h008),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_val_hi),
      .offset(32'h00c),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_cmp_lo),
      .offset(32'h010),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_cmp_hi),
      .offset(32'h014),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_start_lo),
      .offset(32'h018),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_start_hi),
      .offset(32'h01c),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_reset_lo),
      .offset(32'h020),
      .rights("RW")
   );
   default_map.add_reg(
      .rg    (timer_reset_hi),
      .offset(32'h024),
      .rights("RW")
   );
   
endfunction : add_regs_to_map


`endif // _UVME_APB_TIMER_REG_BLOCK_SV__
