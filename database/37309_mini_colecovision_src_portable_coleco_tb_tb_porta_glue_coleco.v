// This program was cloned from: https://github.com/sparkletron/mini_colecovision
// License: MIT License

// test bench, very basic and does no validation.

`define DEF_NTSC_MHZ 140

`timescale 1ns/1ps

module tb_porta_glue_console
  ();

  integer   index = 0;

  reg         clkv = 1'b0;
  reg         resetn_sw = 1'b0;
  reg [15:0]  addr = 0;
  reg [6:0]   C1 = 0;
  reg [6:0]   C2 = 0;
  reg         MREQn = 1'b1;
  reg         IORQn = 1'b1;
  reg         RFSHn = 1'b0;
  reg         M1n   = 1'b1;
  reg         WRn   = 1'b1;
  reg         RDn   = 1'b0;

  wire [7:0]  data_bus;
  wire        ctrl_fire;
  wire        ctrl_arm;
  wire        rom_bank0;
  wire        rom_bank1;
  wire        rom_bank2;
  wire        rom_bank3;
  wire        snd_enable;
  wire        rom_enable;
  wire        ram_enable;
  wire        vdp_wn;
  wire        vdp_rn;
  wire        cpu_waitn;
  wire        cpu_resetn;
  wire        vdp_resetn;

  porta_glue_coleco dut
  (
    .clk(clkv),
    .A(addr),
    .C1P1(C1[0]),
    .C1P2(C1[1]),
    .C1P3(C1[2]),
    .C1P4(C1[3]),
    .C1P6(C1[4]),
    .C1P7(C1[5]),
    .C1P9(C1[6]),
    .C2P1(C2[0]),
    .C2P2(C2[1]),
    .C2P3(C2[2]),
    .C2P4(C2[3]),
    .C2P6(C2[4]),
    .C2P7(C2[5]),
    .C2P9(C2[6]),
    .MREQn(MREQn),
    .IORQn(IORQn),
    .RFSHn(RFSHn),
    .RDn(1'b0),
    .M1n(M1n),
    .WRn(WRn),
    .RESETn_SW(resetn_sw),
    .CP5_ARM(ctrl_arm),
    .CP8_FIRE(ctrl_fire),
    .D(data_bus),
    .CS_h8000n(rom_bank0),
    .CS_hA000n(rom_bank1),
    .CS_hC000n(rom_bank2),
    .CS_hE000n(rom_bank3),
    .SND_ENABLEn(snd_enable),
    .ROM_ENABLEn(rom_enable),
    .RAM_CSn(ram_enable),
    .CSWn(vdp_wn),
    .CSRn(vdp_rn),
    .WAITn(cpu_waitn),
    .RESETn(cpu_resetn),
    .VDP_RESETn(vdp_resetn),
    .RAM_OEn(),
    .INTn(),
    .AS(),
    .AY_SND_ENABLEn()
  );

    // fst dump command
  initial
  begin
    $dumpfile ("tb_porta_glue_console.fst");
    $dumpvars (0, tb_porta_glue_console);
    #1;
  end

  always
  begin
    // toggle indexed clock
    clkv <= ~clkv;
    #(`DEF_NTSC_MHZ);
  end


  initial
  begin
    C2[6] <= 1'b1;
    C1[6] <= 1'b1;
    //hold in reset, and then release
    #50000;
    resetn_sw <= 1'b1;
    #1000000000;
    //should be out of reset, reassert
    resetn_sw <= 1'b0;
    #1000000000;
    //take out of reset
    resetn_sw <= 1'b1;
    #1000000000;
    //check decoder U5
    //enable
    RFSHn <= 1'b1;
    MREQn <= 1'b0;
    #50000;
    //ROM
    addr[13] <= 1'b0;
    addr[14] <= 1'b0;
    addr[15] <= 1'b0;
    #50000;
    //RAM
    addr[13] <= 1'b1;
    addr[14] <= 1'b1;
    #50000;
    //rom_bank0
    addr[13] <= 1'b0;
    addr[14] <= 1'b0;
    addr[15] <= 1'b1;
    #50000;
    //rom_bank1
    addr[13] <= 1'b1;
    #50000;
    //rom_bank2
    addr[13] <= 1'b0;
    addr[14] <= 1'b1;
    #50000;
    //rom_bank3
    addr[13] <= 1'b1;
    #50000;
    //disable
    RFSHn <= 1'b0;
    MREQn <= 1'b1;
    #50000;
    //deassert address lines
    addr[13] <= 1'b0;
    addr[14] <= 1'b0;
    addr[15] <= 1'b0;
    #50000;
    //check decoder U6
    //enable
    IORQn <= 1'b0;
    addr[7] <= 1'b1;
    #50000;
    //control enable 2 (FIRE)
    WRn <= 1'b0;
    addr[5]  <= 1'b0;
    addr[6]  <= 1'b0;
    #50000;
    //vdp write enable (CSWn)
    addr[5]  <= 1'b1;
    #50000;
    //vdp read enable (CSRn)
    WRn <= 1'b1;
    #50000;
    //control enable 1 (ARM)
    WRn <= 1'b0;
    addr[5]  <= 1'b0;
    addr[6]  <= 1'b1;
    #50000;
    //sound enable
    addr[5]  <= 1'b1;
    #50000;
    //control read enable
    WRn <= 1'b1;
    #50000;
    WRn <= 1'b0;
    #50000;
    //controller tests with enabled decoder U6
    //player 1
    WRn <= 1'b1;
    for(index = 0; index < 256; index = index + 1)
    begin
      C1  <= index%128;
      // C1[6] <= 1'b0;
      #5000;
    end
    //player 2
    addr[1] <= 1'b1;
    for(index = 0; index < 256; index = index + 1)
    begin
      C2  <= index%128;
      #5000;
    end
    addr[1]    <= 1'b0;
    WRn   <= 1'b0;
    IORQn <= 1'b1;
    addr[7]    <= 1'b0;
    #5000;
    //assert M1n to test cpu_wait
    M1n <= 1'b0;
    #5000;
    M1n <= 1'b1;
    #5000
    //IO TEST ALL PORTS FOR WRITE
    WRn <= 1'b0;
    IORQn <= 1'b0;
    addr <= 0;
    for(index = 0; index < 256; index = index + 1)
    begin
      addr[7:0]  <= index;
      #5000;
    end
    #5000
    //IO TEST ALL PORTS FOR READ
    WRn <= 1'b1;
    IORQn <= 1'b0;
    addr <= 0;
    for(index = 0; index < 256; index = index + 1)
    begin
      addr[7:0]  <= index;
      #5000;
    end
    #500000;
    $finish;
  end

endmodule
