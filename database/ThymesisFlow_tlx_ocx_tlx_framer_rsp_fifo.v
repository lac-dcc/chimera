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
// File Name          :  ocx_tlx_framer_rsp_fifo.v
// Project            :  TLX 0.7x Reference Design (External Transaction Layer logic for attaching to the IBM P9 OpenCAPI Interface)
// Module Name        :  ocx_tlx_framer_rsp_fifo
//
// Module Description : This logic implements a very small (4 entry) FIFO for responses coming from the AFU.
//
// Module Sub-sections:    (search for @@@)
//
// ******************************************************************************************************************************
// Modification History :
//                                         | Version   |     | Author   | Date        | Description of change
//                                         | --------- |     | -------- | ----------- | ---------------------
   `define OCX_TLX_FRAMER_RSP_FIFO_VERSION  21_Apr_2017   // |          | Apr.21,2017 | Double the depth and remove min-depth option
//
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module ocx_tlx_framer_rsp_fifo
    (
        data_in             ,
        wr_enable           ,
        data_out            ,
        rd_done             ,

        data_available      ,
        valid_entry_count   ,
        underflow_error     ,
        overflow_error      ,

        clock               ,
        reset_n
    ) ;


// ==============================================================================================================================
// @@@  Parameters   (These can be overwritten by module instatiation.)
// ==============================================================================================================================

        // Note:   The FIFO will be *built* using the size specified by these parameters (or as overwritten by instantiation.)
        parameter  REGFILE_DEPTH    =     8 ;        //positive integer
        parameter  REGFILE_WIDTH    =    59 ;        //positive integer
        parameter  FIFO_ADDR_WIDTH  =     3 ;
        parameter  PTR_INC   = 3'b001 ;         
        parameter  CNTR_0    = 4'b0000 ;         
        parameter  CNTR_1    = 4'b0001 ;         
        parameter  CNTR_MAX  = 4'b1000 ;         


// ==============================================================================================================================
// @@@  Port Declarations
// ==============================================================================================================================

        input  [ 58:0]                 data_in              ;
        input                          wr_enable            ;
        output [ 58:0]                 data_out             ;
        input                          rd_done              ;

        output                         data_available       ;
        output [FIFO_ADDR_WIDTH  :0]   valid_entry_count    ;
        output                         underflow_error      ;
        output                         overflow_error       ;

        input                          clock                ;
        input                          reset_n              ;


// ==============================================================================================================================
// @@@  Wires and Variables (Regs)
// ==============================================================================================================================

        (* RAM_STYLE="DISTRIBUTED" *)
        reg    [REGFILE_WIDTH-1:0]   regfile [REGFILE_DEPTH-1:0]   ;

        reg    [FIFO_ADDR_WIDTH-1:0]   wr_addr_pointer_nxt  ;  // Next state of write address pointer
        reg    [FIFO_ADDR_WIDTH-1:0]   wr_addr_pointer      ;  // Write address pointer
        reg    [FIFO_ADDR_WIDTH-1:0]   rd_addr_pointer_nxt  ;  // Next state of read address pointer
        reg    [FIFO_ADDR_WIDTH-1:0]   rd_addr_pointer      ;  // Read address pointer
        reg    [FIFO_ADDR_WIDTH  :0]   valid_entry_cntr_nxt ;  // 
        reg    [FIFO_ADDR_WIDTH  :0]   valid_entry_counter  ;  // Number of valid enries in FIFO: zero=empty, 100=full

        reg                            data_available_int   ;
        reg                            underflow_error_int  ;
        reg                            overflow_error_int   ;


// ==============================================================================================================================
// @@@  ocx_tlx_framer_rsp_fifo Logic
// ==============================================================================================================================

    // ---------------------
    // Register File
    // ---------------------
        always @ (posedge clock) begin
              if(wr_enable) regfile[wr_addr_pointer] <= data_in;
        end
        assign data_out  =  regfile[rd_addr_pointer] ;


    // ---------------------
    // Write Address Pointer
    // ---------------------
    // Write the data into the register array and increment the pointer to point to the next slot.
    always @ (*) begin
        if      ( wr_enable )   begin   wr_addr_pointer_nxt  = wr_addr_pointer + PTR_INC ;         end
        else                    begin   wr_addr_pointer_nxt  = wr_addr_pointer ;                   end
    end
    always @ (posedge clock) begin
        if      (!reset_n)      begin   wr_addr_pointer     <= {FIFO_ADDR_WIDTH{1'b0}};   end
        else                    begin   wr_addr_pointer     <= wr_addr_pointer_nxt;                end
    end


    // ---------------------
    // Read Address Pointer
    // ---------------------
    // This logic reads the register array and captures the output into the output reg
    always @ (*) begin
        if      ( rd_done  )    begin   rd_addr_pointer_nxt  = rd_addr_pointer + PTR_INC ;         end
        else                    begin   rd_addr_pointer_nxt  = rd_addr_pointer ;                   end
    end
    always @ (posedge clock) begin
        if      (!reset_n)      begin   rd_addr_pointer     <= {FIFO_ADDR_WIDTH{1'b0}};   end
        else                    begin   rd_addr_pointer     <= rd_addr_pointer_nxt;                end
    end


    // ---------------------
    // Valid Entry Counter
    // ---------------------
    // This counter keeps track of the number of FIFO slots that are currently being used for valid data.

    always @ (*) begin
        if      ( !wr_enable  && !rd_done  )  begin   valid_entry_cntr_nxt  =  valid_entry_counter          ;    end // No Change
        else if ( !wr_enable  &&  rd_done  )  begin   valid_entry_cntr_nxt  =  valid_entry_counter - CNTR_1 ;    end // Read
        else if (  wr_enable  && !rd_done  )  begin   valid_entry_cntr_nxt  =  valid_entry_counter + CNTR_1 ;    end // Write
        else                                  begin   valid_entry_cntr_nxt  =  valid_entry_counter          ;    end // Write and Read
    end
    always @ (posedge clock) begin
        if      (!reset_n)                    begin   valid_entry_counter  <= {FIFO_ADDR_WIDTH+1{1'b0}};  end
        else                                  begin   valid_entry_counter  <= valid_entry_cntr_nxt;              end
    end
    assign   valid_entry_count  =  valid_entry_counter;



    always @ (*) begin
        if      ( valid_entry_counter > CNTR_0 )                                  begin   data_available_int   =  1'b1;   end
        else                                                                      begin   data_available_int   =  1'b0;   end
        if    ( (valid_entry_counter == CNTR_0)  &&  rd_done )                    begin   underflow_error_int  =  1'b1;   end
        else                                                                      begin   underflow_error_int  =  1'b0;   end
        if    ( (valid_entry_counter == CNTR_MAX)  &&  wr_enable  &&  !rd_done )  begin   overflow_error_int   =  1'b1;   end
        else                                                                      begin   overflow_error_int   =  1'b0;   end
    end
    assign    data_available   =  data_available_int;
    assign    underflow_error  =  underflow_error_int;
    assign    overflow_error   =  overflow_error_int;


endmodule  // ocx_tlx_framer_rsp_fifo
