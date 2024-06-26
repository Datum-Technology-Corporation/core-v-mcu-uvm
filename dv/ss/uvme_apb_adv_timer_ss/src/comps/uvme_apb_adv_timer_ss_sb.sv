// Copyright 2024 Datum Technology Corporation
// All rights reserved.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_APB_ADV_TIMER_SS_SB_SV__
`define __UVME_APB_ADV_TIMER_SS_SB_SV__


/**
 * Component encapsulating scoreboards which compare APB Advanced Timer Sub-System's expected (from predictor) vs. actual (monitored) transactions.
 * @ingroup uvme_apb_adv_timer_ss_comps
 */
class uvme_apb_adv_timer_ss_sb_c extends uvmx_ss_sb_c #(
   .T_CFG  (uvme_apb_adv_timer_ss_cfg_c  ),
   .T_CNTXT(uvme_apb_adv_timer_ss_cntxt_c)
);

   /// @name Components
   /// @{
   /// @}


   `uvm_component_utils(uvme_apb_adv_timer_ss_sb_c)


   /**
    * Default constructor.
    */
   function new(string name="uvme_apb_adv_timer_ss_sb", uvm_component parent=null);
      super.new(name, parent);
   endfunction

   /**
    * Assigns configuration handles.
    */
   virtual function void assign_cfg();
   endfunction

   /**
    * Assigns context handles.
    */
   virtual function void assign_cntxt();
   endfunction

   /**
    * Creates scoreboard components.
    */
   virtual function void create_components();
   endfunction

endclass


`endif // __UVME_APB_ADV_TIMER_SS_SB_SV__