module uart_top_apb (
       input   wire        reset
     , input   wire        clock
     , input   wire        in_psel
     , input   wire        in_penable
     , input   wire [2:0]   in_pprot
     , output              in_pready
     , output  wire        in_pslverr
     , input   wire [31:0] in_paddr
     , input   wire        in_pwrite
     , output  wire [31:0] in_prdata
     , input   wire [31:0] in_pwdata
     , input   wire [3:0]  in_pstrb
     , input   wire        uart_rx       // serial output
     , output  wire        uart_tx       // serial input
);
   //--------------------------------------------------
   wire   rtsn;
   wire   ctsn = 1'b0;
   wire   dtr_pad_o;
   wire   dsr_pad_i=1'b0;
   wire   ri_pad_i =1'b0;
   wire   dcd_pad_i=1'b0;
   wire   interrupt;
   //--------------------------------------------------------
   wire       reg_we;   // Write enable for registers
   wire       reg_re;   // Read enable for registers
   wire [2:0] reg_adr;
   reg  [7:0] reg_dat8_w; // write to reg
   reg  [7:0] reg_dat8_w_reg;
   wire [7:0] reg_dat8_r; // read from reg
   wire       rts_internal;
   assign     rtsn = ~rts_internal;
   //--------------------------------------------------------
   assign in_pready = in_psel && in_penable;
   assign in_pslverr = 1'b0;
   assign reg_we  = ~reset & in_psel & ~in_penable &  in_pwrite;
   assign reg_re  = ~reset & in_psel & ~in_penable & ~in_pwrite;
   assign reg_adr = in_paddr[2:0]; //assign adr_o   = in_paddr[2:0];
   assign in_prdata  = (in_psel) ? {4{reg_dat8_r}} : 'h0;
   always @ (in_paddr[1:0] or in_pwdata) begin
             case (in_paddr[1:0])
             `ifdef ENDIAN_BIG
             2'b00: reg_dat8_w = #1 in_pwdata[31:24];
             2'b01: reg_dat8_w = #1 in_pwdata[23:16];
             2'b10: reg_dat8_w = #1 in_pwdata[15:8];
             2'b11: reg_dat8_w = #1 in_pwdata[7:0];
             `else // little-endian -- default
             2'b00: reg_dat8_w = #1 in_pwdata[7:0];
             2'b01: reg_dat8_w = #1 in_pwdata[15:8];
             2'b10: reg_dat8_w = #1 in_pwdata[23:16];
             2'b11: reg_dat8_w = #1 in_pwdata[31:24];
             `endif
             endcase
   end
   always @ (posedge clock) begin
     reg_dat8_w_reg <= reg_dat8_w;
   end
   //--------------------------------------------------------
   // Registers
   // As shown below reg_dat_i should be stable
   // one-cycle after reg_we negates.
   //              ___     ___     ___     ___     ___     ___
   //  clock    __|   |___|   |___|   |___|   |___|   |___|   |__
   //             ________________        ________________
   //  reg_adr  XX________________XXXXXXXX________________XXXX
   //             ________________
   //  reg_dat_i X________________XXXXXXX
   //                                     ________________
   //  reg_dat_o XXXXXXXXXXXXXXXXXXXXXXXXX________________XXXX
   //                                              _______
   //  reg_re   __________________________________|       |_____
   //              _______
   //  reg_we   __|       |_____________________________________
   //
   uart_regs Uregs(
          .clk         (clock),
          .wb_rst_i    (reset),
          .wb_addr_i   (reg_adr),
          .wb_dat_i    (in_pwrite ? reg_dat8_w:reg_dat8_w_reg),
          .wb_dat_o    (reg_dat8_r),
          .wb_we_i     (reg_we),
          .wb_re_i     (reg_re),
          .modem_inputs({~ctsn, dsr_pad_i, ri_pad_i,  dcd_pad_i}),
          .stx_pad_o   (uart_tx),
          .srx_pad_i   (uart_rx),
          .rts_pad_o   (rts_internal),
          .dtr_pad_o   (dtr_pad_o),
          .int_o       (interrupt)
   );
endmodule
