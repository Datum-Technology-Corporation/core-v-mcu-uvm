// 
// Copyright 2021 Low Power Futures Inc.
// 


// WARNING: THE FOLLOWING IS AUTO-GENERATED CODE.
// ANY CHANGES MADE HERE WILL BE ERASED UPON THE NEXT RELEASE OF THIS RAL.


`ifndef __UVME_APB_TIMER_TIMER_RESET_LO_REG_SV__
`define __UVME_APB_TIMER_TIMER_RESET_LO_REG_SV__


class uvme_apb_timer_timer_reset_lo_reg_c extends uvml_ral_reg_c;
   
   rand uvml_ral_reg_field_c  timer_reset_lo; ///< Write strobe address for resetting the low counter
   
   
   `uvm_object_utils_begin(uvme_apb_timer_timer_reset_lo_reg_c)
      `uvm_field_object(timer_reset_lo, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_apb_timer_timer_reset_lo_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Creates and configures register fields.
    */
   extern virtual function void build();
   
endclass : uvme_apb_timer_timer_reset_lo_reg_c


function uvme_apb_timer_timer_reset_lo_reg_c::new(string name="uvme_apb_timer_timer_reset_lo_reg", int unsigned n_bits=32, int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, n_bits, has_coverage);
   
endfunction : new


function void uvme_apb_timer_timer_reset_lo_reg_c::build();
   
   timer_reset_lo = uvml_ral_reg_field_c::type_id::create("timer_reset_lo");
   timer_reset_lo.configure(
      .parent                 (this),
      .size                   (   31),
      .lsb_pos                (   0),
      .access                 ("WO"),
      .volatile               (   0),
      .reset                  (   0),
      .has_reset              (   1),
      .is_rand                (   1),
      .individually_accessible(   0)
   );
   
endfunction: build


`endif // __UVME_APB_TIMER_TIMER_RESET_LO_REG_SV__
