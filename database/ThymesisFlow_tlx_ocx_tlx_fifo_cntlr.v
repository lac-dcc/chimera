// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 10ps

// ******************************************************************************************************************************
// File Name          :  ocx_tlx_fifo_cntlr.v
// Project            :  TLX 0.7x Reference Design (External Transaction Layer logic for attaching to the IBM P9 OpenCAPI Interface)
// Module Name        :  ocx_tlx_fifo_cntlr
//
// Module Description : This logic does the following:
//     - 
//
// Module Sub-sections:    (search for @@@)
//
// ******************************************************************************************************************************
// Modification History :
//                                    | Version   |     | Author   | Date        | Description of change
//                                    | --------- |     | -------- | ----------- | ---------------------
   `define OCX_TLX_FIFO_CNTLR_VERSION  20_Oct_2017   // |          | Oct.20,2017 | Re-written for to make lint happy
//
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module ocx_tlx_fifo_cntlr
    (

        fifo_wr              ,
        fifo_rd_done         ,

        ram_wr_addr          ,
        ram_wr_enable        ,
        ram_rd_addr          ,
        rd_data_capture      ,

        fifo_data_look_ahead ,
        fifo_data_available  ,
        fifo_underflow_error ,
        fifo_overflow_error  ,

        clock                ,
        reset_n
    ) ;


// ==============================================================================================================================
// @@@  Parameters   (These can be overwritten by module instatiation.)
// ==============================================================================================================================
        // Note:   The FIFO will be *built* using the size specified by these parameters (or as overwritten by instantiation.)
        parameter  FIFO_ADDR_WIDTH  =   4 ;



// ==============================================================================================================================
// @@@  Port Declarations
// ==============================================================================================================================

        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        input                          fifo_wr              ;
        input                          fifo_rd_done         ;
     
        output [FIFO_ADDR_WIDTH-1:0]   ram_wr_addr          ;
        output                         ram_wr_enable        ;
        output [FIFO_ADDR_WIDTH-1:0]   ram_rd_addr          ;
        output                         rd_data_capture      ;

        output                         fifo_data_look_ahead ;
        output                         fifo_data_available  ;
        output                         fifo_underflow_error ;
        output                         fifo_overflow_error  ;

        input                          clock                ;
        input                          reset_n              ;


// ==============================================================================================================================
// @@@  Wires and Variables (Regs)
// ==============================================================================================================================

        wire   [FIFO_ADDR_WIDTH-1:0]   ptr_inc            ;  // Vector to increment address pointers by one.
        wire   [FIFO_ADDR_WIDTH  :0]   cntr_0             ;  // Vector to load the reset the address pointers to zero
        wire   [FIFO_ADDR_WIDTH  :0]   cntr_1             ;  // Vector to set the addres pointers to 1
        wire   [FIFO_ADDR_WIDTH  :0]   cntr_max           ;  // Max number of valid entries in the FIFO.

        wire   [FIFO_ADDR_WIDTH-1:0]   wr_addr_pointer_d  ;  // Next state of write address pointer
        reg    [FIFO_ADDR_WIDTH-1:0]   wr_addr_pointer_q  ;  // Write address pointer
        wire   [FIFO_ADDR_WIDTH-1:0]   rd_addr_pointer_d  ;  // Next state of read address pointer
        reg    [FIFO_ADDR_WIDTH-1:0]   rd_addr_pointer_q  ;  // Read address pointer
        wire   [FIFO_ADDR_WIDTH  :0]   valid_entry_cntr_d ;  // 
        reg    [FIFO_ADDR_WIDTH  :0]   valid_entry_cntr_q ;  // Number of valid enries in FIFO: zero=empty, 10000=full

        wire    fifo_will_be_empty   ;
        wire    fifo_empty           ;
        wire    fifo_full            ;

        wire    fifo_data_early      ;
        reg     fifo_data_available1 ;


// ==============================================================================================================================
// @@@  ocx_tlx_fifo_cntlr Logic
// ==============================================================================================================================
      
    assign ptr_inc  =  {{FIFO_ADDR_WIDTH-1{1'b0}}, 1'b1} ;   // Vector to increment address pointers by one.
    assign cntr_0   =   {FIFO_ADDR_WIDTH+1{1'b0}}        ;   // Vector to load the reset the address pointers to zero
    assign cntr_1   =  {{FIFO_ADDR_WIDTH{1'b0}}, 1'b1}   ;   // Vector to set the addres pointers to 1
    assign cntr_max =  {1'b1, {FIFO_ADDR_WIDTH{1'b0}}}   ;   // Max number of valid entries in the FIFO.


    // ---------------------
    // Write Address Pointer
    // ---------------------
    // Write the data into the register array and increment the pointer to point to the next slot.
    assign   wr_addr_pointer_d  =   ( fifo_wr )   ?  wr_addr_pointer_q + ptr_inc :
                                                     wr_addr_pointer_q           ;
    always @ (posedge clock) begin
        if      (!reset_n)        wr_addr_pointer_q       <= {FIFO_ADDR_WIDTH{1'b0}};
        else                      wr_addr_pointer_q       <= wr_addr_pointer_d;
    end
    assign  ram_wr_enable   =  fifo_wr;             // Write the RAM *before* the write addr pointer is incremented.
    assign  ram_wr_addr     =  wr_addr_pointer_q;   // Pass address to RAM


    // ---------------------
    // Read Address Pointer
    // ---------------------
    // This logic reads the register array and captures the output into the output reg
    assign   rd_addr_pointer_d  =  ( fifo_rd_done  )  ?  rd_addr_pointer_q + ptr_inc :
                                                         rd_addr_pointer_q           ;
    always @ (posedge clock) begin
        if      (!reset_n)        rd_addr_pointer_q       <= {FIFO_ADDR_WIDTH{1'b0}};
        else                      rd_addr_pointer_q       <= rd_addr_pointer_d;
    end
    assign  ram_rd_addr       =  rd_addr_pointer_d;   // Pass address to Register Array
    assign  rd_data_capture   =  1'b1 ;               // Hardwire the system to always capture the fifo output.


    // ---------------------
    // Valid Entry Counter
    // ---------------------
    // This counter keeps track of the number of FIFO slots that are currently being used for valid data.
    // In addition to the clock, there are four inputs that affect the state of this counter.
    // Here is a next-state table for this counter
    // fifo_wr  fifo_rd_done  fifo_full  fifo_empty  state-change  comment
    // -------  -------       ---------  ----------  ------------  -------
    //    0        0              x           x        no change
    //    0        1              x           0           -1       Normal read
    //    0        1              x           1        set to 0    Underflow error
    //    1        0              0           x           +1       Normal write
    //    1        0              1           x        no change   Overflow error
    //    1        1              0           0        no change   Simultaneous write and read
    //    1        1              0           1           +1       Underflow error  (May be allowed with UltraRAM, but not in this design.)
    //    1        1              1           0        no change   Overflow error
    //    1        1              1           1        no change   Impossible state

    assign   valid_entry_cntr_d  =  ( !fifo_wr  && !fifo_rd_done                                )  ?  valid_entry_cntr_q          : // No change
                                    ( !fifo_wr  &&  fifo_rd_done                 && !fifo_empty )  ?  valid_entry_cntr_q - cntr_1 : // Read
                                    ( !fifo_wr  &&  fifo_rd_done                 &&  fifo_empty )  ?  cntr_0                      : // Underflow
                                    (  fifo_wr  && !fifo_rd_done  && !fifo_full                 )  ?  valid_entry_cntr_q + cntr_1 : // Write
                                    (  fifo_wr  && !fifo_rd_done  &&  fifo_full                 )  ?  valid_entry_cntr_q          : // Overflow
                                    (  fifo_wr  &&  fifo_rd_done  && !fifo_full  && !fifo_empty )  ?  valid_entry_cntr_q          : // Write and Read
                                    (  fifo_wr  &&  fifo_rd_done  && !fifo_full  &&  fifo_empty )  ?  cntr_1                      : // Underflow
                                    (  fifo_wr  &&  fifo_rd_done  &&  fifo_full  && !fifo_empty )  ?  valid_entry_cntr_q          : // Overflow
                                                                                                      valid_entry_cntr_q          ; // Invalid state
    always @ (posedge clock) begin
        if      (!reset_n)        valid_entry_cntr_q       <= {FIFO_ADDR_WIDTH+1{1'b0}};
        else                      valid_entry_cntr_q       <= valid_entry_cntr_d;
    end

    assign   fifo_will_be_empty   =  ( valid_entry_cntr_d == cntr_0   )  ?  1'b1  :  1'b0 ;
    assign   fifo_empty           =  ( valid_entry_cntr_q == cntr_0   )  ?  1'b1  :  1'b0 ;
    assign   fifo_full            =  ( valid_entry_cntr_q >= cntr_max )  ?  1'b1  :  1'b0 ;

    // Predict when the data will be available on the fifo output.
    // Data will not be available when there is only one entry and it is being read.
    assign    fifo_data_early      =  !fifo_will_be_empty  &&  !fifo_empty  && !(fifo_rd_done && fifo_wr && valid_entry_cntr_d == cntr_1);

    // FF to generate 1-cycle delay of fifo_data_early.
    always @ (posedge clock) begin
        if      (!reset_n)        fifo_data_available1       <=  1'b0;
        else                      fifo_data_available1       <=  fifo_data_early;
    end

    assign    fifo_data_look_ahead =  fifo_data_early; 
    assign    fifo_data_available  =  fifo_data_available1; 
    assign    fifo_underflow_error =   fifo_empty  &&  fifo_rd_done;
    assign    fifo_overflow_error  =   fifo_full   &&  fifo_wr  &&  !fifo_rd_done;


endmodule  // ocx_tlx_fifo_cntlr
