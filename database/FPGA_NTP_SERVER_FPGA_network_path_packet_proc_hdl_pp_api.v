//======================================================================
//
// pp_api.v
// -------
// API module for packet processing. Allows us to remove a lot of wide
// buses and allow us to add more IP addresses.
//
//
// Author: Joachim Strombergson
//
// Copyright 2019-2021 Netnod Internet Exchange i Sverige AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module pp_api(
              input wire           clk,
              input wire           areset,

              input wire           cs,
              input wire           we,
              input wire  [11 : 0] address,
              input wire  [31 : 0] write_data,
              output wire [31 : 0] read_data,
              output wire          ready
             );


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam ADDR_NAME0         = 12'h000;
  localparam ADDR_NAME1         = 12'h001;
  localparam ADDR_VERSION       = 12'h002;

  localparam ADDR_OP_A          = 12'h010;
  localparam ADDR_OP_B          = 12'h011;
  localparam ADDR_SUM           = 12'h011;

  localparam CORE_NAME0   = 32'h70705f61; // "pp_a"
  localparam CORE_NAME1   = 32'h70692020; // "pi  "
  localparam CORE_VERSION = 32'h302e3130; // "0.10"


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [31 : 0]  opa_reg;
  reg           opa_we;

  reg [31 : 0]  opb_reg;
  reg           opb_we;

  reg [31 : 0]  sum_reg;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [31 : 0] tmp_read_data;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign read_data     = tmp_read_data;
  assign ready         = 1'h1;


  //----------------------------------------------------------------
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset.
  //----------------------------------------------------------------
  always @ (posedge clk or posedge areset)
    begin : reg_update
      integer i;

      if (areset)
        begin
          opa_reg   <= 32'h0;
          opb_reg   <= 32'h0;
          sum_reg   <= 32'h0;
        end
      else
        begin
          sum_reg <= opa_reg + opb_reg;

          if (opa_we)
            opa_reg <= write_data;

          if (opb_we)
            opb_reg <= write_data;
        end
    end // reg_update


  //----------------------------------------------------------------
  // api
  //----------------------------------------------------------------
  always @*
    begin : api
      tmp_read_data = 32'hbeef_beef;
      opa_we        = 1'h0;
      opb_we        = 1'h0;

      if (cs)
        begin
          if (we)
            begin
              case (address)
                ADDR_OP_A: opa_we = 1'h1;
                ADDR_OP_B: opb_we = 1'h1;

                default:
                  begin
                  end
              endcase // case (address)
            end // if (we)

          else
            begin
              case (address)
                ADDR_NAME0:    tmp_read_data = CORE_NAME0;
                ADDR_NAME1:    tmp_read_data = CORE_NAME1;
                ADDR_VERSION:  tmp_read_data = CORE_VERSION;

                ADDR_OP_A:     tmp_read_data = opa_reg;
                ADDR_OP_B:     tmp_read_data = opb_reg;
                ADDR_SUM:      tmp_read_data = sum_reg;

                default:
                  begin
                  end
              endcase // case (address)
            end // else: !if(we)
        end
    end // api

endmodule // pp_api

//======================================================================
// EOF pp_api.v
//======================================================================
