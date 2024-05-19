// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "axi.vh"

module iob2axi_rd
  #(
    parameter ADDR_W = 0,
    parameter DATA_W = 0,
    // AXI-4 Full I/F parameters
    parameter AXI_ADDR_W = ADDR_W,
    parameter AXI_DATA_W = DATA_W
    )
   (
    input                  clk,
    input                  rst,

    //
    // Control I/F
    //
    input                  run,
    input [ADDR_W-1:0]     addr,
    input [`AXI_LEN_W-1:0] length,
    output reg             ready,
    output reg             error,

    //
    // AXI-4 Full Master Read I/F
    //
`include "m_axi_read_m_port.vh"

    //
    // Native Master Write I/F
    //
    output reg             m_valid,
    output [ADDR_W-1:0]    m_addr,
    output [DATA_W-1:0]    m_wdata,
    output [DATA_W/8-1:0]  m_wstrb,
    input                  m_ready
    );

   localparam axi_arsize = $clog2(DATA_W/8);

   localparam ADDR_HS=1'h0, READ=1'h1;

   // State signals
   reg                      state, state_nxt;

   // Counter, error and ready register signals
   reg [`AXI_LEN_W-1:0]     counter, counter_nxt;
   reg                      error_nxt;
   reg                      ready_nxt;

   reg                      m_axi_arvalid_int;
   reg                      m_axi_rready_int;

   // Control register signals
   reg [ADDR_W-1:0]         addr_reg;
   reg [`AXI_LEN_W-1:0]     length_reg;

   // Hold
   reg                      m_valid_reg;
   wire                     hold = m_valid_reg & ~m_ready;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         m_valid_reg <= 1'b0;
      end else begin
         m_valid_reg <= m_valid;
      end
   end

   reg [DATA_W-1:0]         m_axi_rdata_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         m_axi_rdata_reg <= {DATA_W{1'b0}};
      end else if (~hold) begin
         m_axi_rdata_reg <= m_axi_rdata;
      end
   end

   assign m_wdata = hold? m_axi_rdata_reg: m_axi_rdata;
   assign m_wstrb = {(DATA_W/8){1'b1}};

   // Read address
   assign m_axi_arid    = `AXI_ID_W'd0;
   assign m_axi_arvalid = m_axi_arvalid_int;
   assign m_axi_araddr  = run? addr: addr_reg;
   assign m_axi_arlen   = run? length: length_reg;
   assign m_axi_arsize  = axi_arsize;
   assign m_axi_arburst = `AXI_BURST_W'd1;
   assign m_axi_arlock  = `AXI_LOCK_W'b0;
   assign m_axi_arcache = `AXI_CACHE_W'd2;
   assign m_axi_arprot  = `AXI_PROT_W'd2;
   assign m_axi_arqos   = `AXI_QOS_W'd0;

   // Read
   assign m_axi_rready = m_axi_rready_int;

   // Counter, error and ready registers
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         counter <= `AXI_LEN_W'd0;
         error <= 1'b0;
         ready <= 1'b1;
      end else begin
         counter <= counter_nxt;
         error <= error_nxt;
         ready <= ready_nxt;
      end
   end

   // Control registers
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         addr_reg <= {ADDR_W{1'b0}};
         length_reg <= `AXI_LEN_W'd0;
      end else if (run) begin
         addr_reg <= addr;
         length_reg <= length;
      end
   end

   wire                     rst_valid_int = (state_nxt == ADDR_HS)? 1'b1: 1'b0;
   reg                      arvalid_int;

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         arvalid_int <= 1'b0;
      end else if (rst_valid_int) begin
         arvalid_int <= 1'b1;
      end else if (m_axi_arready) begin
         arvalid_int <= 1'b0;
      end
   end

   //
   // FSM
   //

   // State register
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         state <= ADDR_HS;
      end else begin
         state <= state_nxt;
      end
   end

   // State machine
   always @* begin
      state_nxt = state;

      error_nxt = error;
      ready_nxt = 1'b0;
      counter_nxt = counter;

      m_valid = 1'b0;

      m_axi_arvalid_int = 1'b0;
      m_axi_rready_int = 1'b0;

      case (state)
        // Read address handshake
        ADDR_HS: begin
           counter_nxt = `AXI_LEN_W'd0;
           ready_nxt = 1'b1;

           if (run) begin
              m_axi_arvalid_int = 1'b1;

              if(m_axi_arready) begin
                 state_nxt = READ;

                 ready_nxt = 1'b0;
              end
           end
        end
        // Read data
        READ: begin
           m_valid = m_axi_rvalid;

           m_axi_arvalid_int = arvalid_int;
           m_axi_rready_int = ~hold;

           if (~hold & m_axi_rvalid) begin
              if (counter == length_reg) begin
                 error_nxt = |{~m_axi_rlast, m_axi_rresp};

                 state_nxt = ADDR_HS;
              end

              counter_nxt = counter + 1'b1;
           end
        end
      endcase
   end

endmodule
