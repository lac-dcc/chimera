// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps
`include "iob_intercon.vh"

module iob_split
  #(
    parameter DATA_W = 32,
    parameter ADDR_W = 32,
    parameter N_SLAVES = 2, //number of slaves
    parameter P_SLAVES = `REQ_W-2 //slave select word msb position
    )
   (
    input                            clk,
    input                            rst,

    //masters interface
    input [`REQ_W-1:0]               m_req,
    output reg [`RESP_W-1:0]         m_resp,

    //slave interface
    output reg [N_SLAVES*`REQ_W-1:0] s_req,
    input [N_SLAVES*`RESP_W-1:0]     s_resp
    );

   localparam  Nb=$clog2(N_SLAVES)+($clog2(N_SLAVES)==0);


   //slave select word
   wire [Nb-1:0] s_sel;
   assign s_sel = m_req[P_SLAVES -:Nb];

   //route master request to selected slave
   integer                           i;
   always @* begin
      /*
     $display("pslave %d", P_SLAVES+1);
     $display("mreq %x", m_req);
     $display("s_sel %x", s_sel);
   */
     for (i=0; i<N_SLAVES; i=i+1)
       if(i == s_sel)
         s_req[`req(i)] = m_req;
       else
         s_req[`req(i)] = {(`REQ_W){1'b0}};
   end

   //
   //route response from previously selected slave to master
   //

   //register the slave selection
   reg [Nb-1:0]                       s_sel_reg;
   always @( posedge clk, posedge rst ) begin
      if( rst )
        s_sel_reg <= {Nb{1'b0}};
      else
        s_sel_reg <= s_sel;
   end

   //route
   integer                           j;
   always @* begin
      m_resp = {`RESP_W{1'b0}};
      for (j=0; j<N_SLAVES; j=j+1)
        if( j == s_sel_reg )
          m_resp = s_resp[`resp(j)];
   end

endmodule
