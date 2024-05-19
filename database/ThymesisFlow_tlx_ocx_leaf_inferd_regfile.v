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
// File Name          :  ocx_leaf_inferd_regfile.v
// Project            :  TLX 0.7x Reference Design (External Transaction Layer logic for attaching to the IBM P9 OpenCAPI Interface)
// Module Name        :  ocx_leaf_inferd_regfile
//
// Module Description : This logic does the following:
//     - 
//
// Module Sub-sections:    (search for @@@)
//
// ******************************************************************************************************************************
// Modification History :
//                                      | Version   |     | Author   | Date        | Description of change
//                                      | --------- |     | -------- | ----------- | ---------------------
`define OCX_LEAF_INFERD_REGFILE_VERSION  19_Jul_2016   // |          | Jul.19,2016 | Initial creation
//
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module ocx_leaf_inferd_regfile
    (
        // Port A module ports (This is a WRITE-ONLY port.)
        clka   ,
        ena    ,
        addra  ,
        dina   ,
   
        // Port B module ports (This is a READ-ONLY port.)
        clkb   ,
        rstb_n ,
        enb    ,
        addrb  ,
        doutb
    ) ;


// ==============================================================================================================================
// @@@  Parameters   (These can be overwritten by module instatiation.)
// ==============================================================================================================================
       
        parameter  REGFILE_DEPTH   =    16 ;        //positive integer
        parameter  REGFILE_WIDTH   =   576 ;        //positive integer
        parameter  ADDR_WIDTH      =     4 ;        //positive integer
   

// ==============================================================================================================================
// @@@  Port Declarations
// ==============================================================================================================================
   
        // Port A module ports (This is a WRITE-ONLY port.)
        input                        clka   ;
        input                        ena    ;
        input  [ADDR_WIDTH-1:0]      addra  ;
        input  [REGFILE_WIDTH-1:0]   dina   ;
   
        // Port B module ports (This is a READ-ONLY port.)
        input                        clkb   ;
        input                        rstb_n ;
        input                        enb    ;
        input  [ADDR_WIDTH-1:0]      addrb  ;
        output [REGFILE_WIDTH-1:0]   doutb  ;



// ==============================================================================================================================
// @@@  Wires and Variables (Regs)
// ==============================================================================================================================

        (* RAM_STYLE="DISTRIBUTED" *)
        reg    [REGFILE_WIDTH-1:0]   regfile [REGFILE_DEPTH-1:0]   ;
        reg    [REGFILE_WIDTH-1:0]   output_reg  ;


// ==============================================================================================================================
// @@@  ocx_leaf_inferd_regfile Logic
// ==============================================================================================================================

        // Regfile memory array
        always @ (posedge clka) begin
              if(ena)    begin   regfile[addra] <= dina;  end
        end

        // Output register
        always @ (posedge clkb) begin
            if    (!rstb_n)         begin  output_reg  <= {REGFILE_WIDTH{1'b0}};   end
            else if (enb)           begin  output_reg  <= regfile[addrb];          end
        end

        assign  doutb  =  output_reg ;


endmodule  // ocx_leaf_inferd_regfile
