// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_CVMCU_REG_HW_RESET_VSEQ_SV__
`define __UVME_CVMCU_REG_HW_RESET_VSEQ_SV__


/**
 * Virtual sequence that checks that the hardware reset value specified in the register block (uvme_cvmcu_reg_block_c) matches the DUT's.
 */
class uvme_cvmcu_reg_hw_reset_vseq_c extends uvme_cvmcu_reg_base_vseq_c;
   
   `include "uvme_cvmcu_reg_hw_reset_vseq_ignore_list.sv"
   
   // Sub-sequences
   rand uvm_reg_hw_reset_seq  single_block_hw_reset_seq;
   rand uvm_reg_hw_reset_seq  all_blocks_hw_reset_seq[];
   
   
   `uvm_object_utils_begin(uvme_cvmcu_reg_hw_reset_vseq_c)
      `uvm_field_object      (single_block_hw_reset_seq, UVM_DEFAULT)
      `uvm_field_array_object(all_blocks_hw_reset_seq  , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint limits_cons {
      // TODO Constrain size of all_blocks_hw_reset_seq
      //      Ex: all_blocks_hw_reset_seq.size() == UVME_CVMCU_MAX_NUM_CHANNELS;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_cvmcu_reg_hw_reset_vseq");
   
   /**
    * TODO Describe uvme_cvmcu_reg_hw_reset_vseq_c::run_single_block()
    */
   extern virtual task run_single_block();
   
   /**
    * TODO Describe uvme_cvmcu_reg_hw_reset_vseq_c::run_all_blocks()
    */
   extern virtual task run_all_blocks();
   
endclass : uvme_cvmcu_reg_hw_reset_vseq_c


function uvme_cvmcu_reg_hw_reset_vseq_c::new(string name="uvme_cvmcu_reg_hw_reset_vseq");
   
   super.new(name);
   
   single_block_hw_reset_seq = uvm_reg_hw_reset_seq::type_id::create("single_block_hw_reset_seq");
   
   // TODO Initialize all_blocks_hw_reset_seq array
   //      Ex: all_blocks_hw_reset_seq = new[UVME_CVMCU_MAX_NUM_CHANNELS];
   foreach (all_blocks_hw_reset_seq[ii]) begin
     all_blocks_hw_reset_seq[ii] = uvm_reg_hw_reset_seq::type_id::create($sformatf("all_blocks_hw_reset_seq[%0d]", ii));
   end
   
endfunction : new


task uvme_cvmcu_reg_hw_reset_vseq_c::run_single_block();
   
   // TODO Implement uvme_cvmcu_reg_hw_reset_vseq_c::run_single_block()
   //      Ex: single_block_hw_reset_seq.model = single_block;
   //          `uvm_send(single_block_hw_reset_seq)
   
endtask : run_single_block


task uvme_cvmcu_reg_hw_reset_vseq_c::run_all_blocks();
   
   // TODO Implement uvme_cvmcu_reg_hw_reset_vseq_c::run_all_blocks()
   //      Ex: fork
   //             begin
   //                foreach (cfg.ral.channels[_ii]) begin
   //                   fork
   //                      automatic int unsigned ii = _ii;
   //                      
   //                      begin
   //                         all_blocks_hw_reset_seq[ii].model = cfg.cvmcu_reg_block.channels[ii];
   //                         `uvm_send(all_blocks_hw_reset_seq[ii])
   //                      end
   //                   join_none
   //                end
   //                wait fork;
   //             end
   //          join
   
endtask : run_all_blocks


`endif // __UVME_CVMCU_REG_HW_RESET_VSEQ_SV__
