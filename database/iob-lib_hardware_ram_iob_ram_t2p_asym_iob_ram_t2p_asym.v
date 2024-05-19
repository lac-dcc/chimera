// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps
`include "iob_lib.vh"

module iob_ram_t2p_asym
  #(parameter
    W_DATA_W = 0,
    R_DATA_W = 0,
    ADDR_W = 0,
    // determine W_ADDR_W and R_ADDR_W
    MAXDATA_W = `IOB_MAX(W_DATA_W, R_DATA_W),
    MINDATA_W = `IOB_MIN(W_DATA_W, R_DATA_W),
    MINADDR_W = ADDR_W-$clog2(MAXDATA_W/MINDATA_W), // lower ADDR_W (higher DATA_W)
    W_ADDR_W = (W_DATA_W == MAXDATA_W) ? MINADDR_W : ADDR_W,
    R_ADDR_W = (R_DATA_W == MAXDATA_W) ? MINADDR_W : ADDR_W
    )
   (
    //write port
    input                     w_clk,
    input                     w_en,
    input [W_DATA_W-1:0]      w_data,
    input [W_ADDR_W-1:0]      w_addr,

    //read port
    input                     r_clk,
    input                     r_en,
    input [R_ADDR_W-1:0]      r_addr,
    output reg [R_DATA_W-1:0] r_data
    );

   //determine the number of blocks N
   localparam N = MAXDATA_W/MINDATA_W;
   
   //symmetric memory block buses
   //write buses
   reg [N-1:0]                en_wr;
   reg [MINDATA_W-1:0]        data_wr [N-1:0];
   reg [MINADDR_W-1:0]        addr_wr [N-1:0];

   //read buses
   wire [MINDATA_W-1:0]       data_rd [N-1:0];
   reg [MINADDR_W-1:0]        addr_rd [N-1:0];

   //instantiate N symmetric RAM blocks and connect them to the buses
   genvar                 i;
   generate 
      for (i=0; i<N; i=i+1) begin : t2p_ram_array
         iob_ram_t2p
             #(
               .DATA_W(MINDATA_W),
               .ADDR_W(MINADDR_W)
               )
         iob_ram_t2p_inst
             (
              .w_clk(w_clk),
              .w_en(en_wr[i]),
              .w_addr(addr_wr[i]),
              .w_data(data_wr[i]),

              .r_clk(r_clk),
              .r_en(r_en),
              .r_addr(addr_rd[i]),
              .r_data(data_rd[i])              
              );
         
      end
   endgenerate

   integer j,k,l;

   generate

      if (W_DATA_W > R_DATA_W) begin
          //write parallel
         always @* begin
            for (j=0; j < N; j= j+1) begin
               en_wr[j] = w_en;
               data_wr[j] = w_data[j*MINDATA_W +: MINDATA_W];
               addr_wr[j] = w_addr;
            end
         end
         
         //read serial
         always @* begin
            for (k=0; k < N; k= k+1) begin
               addr_rd[k] = r_addr[R_ADDR_W-1-:W_ADDR_W];
            end
         end

         //read address register
         reg [R_ADDR_W-W_ADDR_W-1:0] r_addr_lsbs_reg;
         always @(posedge r_clk)
           if (r_en)
             r_addr_lsbs_reg <= r_addr[R_ADDR_W-W_ADDR_W-1:0];
           
         //read mux
         always @* begin
            r_data = 1'b0;
            for (l=0; l < N; l= l+1) begin
               r_data = data_rd[r_addr_lsbs_reg];
            end
         end
 
      end else if (W_DATA_W < R_DATA_W) begin
         //write serial
         always @* begin
            for (j=0; j < N; j= j+1) begin
               en_wr[j] = w_en & (w_addr[W_ADDR_W-R_ADDR_W-1:0] == j);
               data_wr[j] = w_data;
               addr_wr[j] = w_addr[W_ADDR_W-1 -: R_ADDR_W];
            end
         end
         //read parallel
         always @* begin
            r_data = 1'b0;
            for (k=0; k < N; k= k+1) begin
               addr_rd[k] = r_addr;
               r_data[k*MINDATA_W +: MINDATA_W] = data_rd[k];
            end
         end

      end else begin //W_DATA_W = R_DATA_W
         //write serial
         always @* begin
            en_wr = w_en;
            data_wr[0] = w_data;
            addr_wr[0] = w_addr;
         end
         //read parallel
         always @(r_addr, data_rd[0]) begin
            addr_rd[0] = r_addr;
            r_data = data_rd[0];
         end

      end 
   endgenerate
endmodule
