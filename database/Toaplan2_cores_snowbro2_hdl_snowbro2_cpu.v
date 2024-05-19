// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* <-- atrac17 -->
* https://coinopcollection.org
* https://twitter.com/_atrac17
* https://github.com/atrac17
*
* Copyright (c) 2022 atrac17
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module snowbro2_cpu (
    input       CLK,
    input       CLK96,
    input       RESET,
    input       RESET96,
    input       GP9001ACK,
    input       VINT,
    input       BR,
    input [8:0] V,
    output      BUSACK,
    input       LVBL,
    input       FLIP,

    output [19:1] ADDR,
    output [15:0] DOUT,
    output        RW,
    output        RD,
    output        LDS,
    output        LDSWR,
    output        GP9001CS,
    output        LTABLECS,
    output        VCOUNTCS,
    output        CEN16,
    output        CEN16B,

    // cabinet I/O
    input [1:0] JOYMODE,
    input [9:0] JOYSTICK1,
    input [9:0] JOYSTICK2,
    input [9:0] JOYSTICK3,
    input [9:0] JOYSTICK4,
    input [3:0] START_BUTTON,
    input [3:0] COIN_INPUT,
    input       SERVICE,
    input       TILT,

    // DIP switches
    input       DIP_TEST,
    input       DIP_PAUSE,
    input [7:0] DIPSW_A,
    input [7:0] DIPSW_B,
    input [7:0] DIPSW_C,

    //68k rom interface
    output            CPU_PRG_CS,
    input             CPU_PRG_OK,
    output reg [18:0] CPU_PRG_ADDR, //16bit addressing
    input      [15:0] CPU_PRG_DATA,

    //gcu interface
    output reg   GP9001_OP_SELECT_REG,
    output reg   GP9001_OP_WRITE_REG,
    output reg   GP9001_OP_WRITE_RAM,
    output reg   GP9001_OP_READ_RAM_H,
    output reg   GP9001_OP_READ_RAM_L,
    output reg   GP9001_OP_SET_RAM_PTR,
    input [15:0] GP9001_DOUT,
    input        HSYNC,
    input        VSYNC,
    input        FBLANK,
    input  [7:0] GAME,

    //palette ram
    input  [10:0] PALRAM_ADDR,
    output [15:0] PALRAM_DATA,

    //sound interface
    output       YM2151_CS,
    output       OKI_CS,
    output       YM2151_WE,
    output       YM2151_WR_CMD,
    output       OKI_WE,
    output [7:0] OKI_DIN,
    output [7:0] YM2151_DIN,
    input  [7:0] YM2151_DOUT,
    input  [7:0] OKI_DOUT,
    output reg   OKI_BANK
);

localparam SNOWBRO2 = 'h2;

//address bus
wire [23:1] A;
wire [23:0] addr_8 = {A[23:1], 1'b0}; //this makes it easier to follow the memory map.
wire [15:0] cpu_dout;
wire sel_ram;
wire sel_rom;
reg ram_ok = 1'b1;
reg sel_gp9001;
reg sel_io;
reg dsn_dly;
reg pre_sel_ram;
reg pre_sel_rom;
reg reg_sel_ram;
reg reg_sel_rom;
reg pre_sel_palram;
reg reg_sel_palram;
wire sel_palram;
wire [15:0] wram_cpu_data = !RW && (sel_ram || sel_palram) ? cpu_dout : 16'h0000;
wire [15:0] main_ram_q0;
wire [15:0] main_palram_q0;
wire [15:0] main_ram2_q0;

//the first 19 bits are used to address other devices (ie. ROM/RAM). The rest are used for selects.
assign ADDR[19:1] = A[19:1];
assign DOUT = cpu_dout;
reg [15:0] cpu_din;
wire BUSn, UDSn, LDSn, ASn, LDSWn, UDSWn;
assign LDS = LDSn;
assign LDSWR = LDSWn;
assign BUSn  = ASn | (UDSn & LDSn);
assign UDSWn = RW | UDSn;
assign LDSWn = RW | LDSn;

// ram_cs and vram_cs signals go down before DSWn signals
// that causes a false read request to the SDRAM. In order
// to avoid that a little bit of logic is needed:

assign sel_ram = pre_sel_ram; // ~BUSn & (dsn_dly ? reg_sel_ram  : pre_sel_ram);
assign sel_rom = pre_sel_rom; // ~BUSn & (dsn_dly ? reg_sel_rom : pre_sel_rom);
assign sel_palram = pre_sel_palram; // ~BUSn & (dsn_dly ? sel_palram : pre_sel_palram);
assign CPU_PRG_CS = pre_sel_rom;

//sound assigns
reg sel_oki;
reg oki_bankswitch;
wire sel_ym2151 = YM2151_CS;
assign YM2151_CS = (addr_8[23:20] == 'b0101);
assign YM2151_WE = RW;
assign YM2151_WR_CMD = A[1];
assign YM2151_DIN = cpu_dout[7:0];
assign OKI_CS = sel_oki;
assign OKI_WE = ~(OKI_CS && !RW);
assign OKI_DIN = cpu_dout[7:0];

always @(posedge CLK96, posedge RESET96) begin
    if( RESET96 ) begin
        reg_sel_rom <= 0;
        reg_sel_ram  <= 0;
        reg_sel_palram <= 0;
        dsn_dly  <= 1;
    end else if(CEN16) begin
        reg_sel_rom <= pre_sel_rom;
        reg_sel_ram  <= pre_sel_ram;
        reg_sel_palram <= pre_sel_palram;
        dsn_dly <= &{UDSWn,LDSWn}; // low if any DSWn was low
    end
end

wire FC0, FC1, FC2;
wire VPAn = ~&{ FC0, FC1, FC2, ~ASn};
wire BRn, BGACKn, BGn, DTACKn;
wire bus_cs = |{ pre_sel_rom, pre_sel_ram, pre_sel_palram, sel_gp9001, sel_io, sel_ym2151};
wire bus_busy = |{ (sel_ram || sel_palram) & ~ram_ok, sel_rom & ~CPU_PRG_OK, sel_gp9001 & ~GP9001ACK, sel_ym2151 & YM2151_DOUT[7]};

//i/o bus ports
reg gp9001_vdp_device_r_cs;
reg gp9001_vdp_device_w_cs;
reg read_port_in1_r_cs;
reg read_port_in2_r_cs;
reg read_port_in3_r_cs;
reg read_port_in4_r_cs;
reg read_port_sys_r_cs;
reg read_port_dswa_r_cs;
reg read_port_dswb_r_cs;
reg read_port_jmpr_r_cs;
reg toaplan2_coinword_w_cs;
reg video_count_r_cs;

//debugging 
wire debug = 1'b1;
integer fd;

`ifdef SIMULATION
 initial fd = $fopen("log.txt", "w");
`endif

always @(posedge CLK96 or posedge RESET96) begin
    if(RESET96) begin
        pre_sel_rom<=0;
        pre_sel_ram<=0;
        pre_sel_palram<=0;
        sel_gp9001<=0;
        sel_io<=0;
        CPU_PRG_ADDR<=19'd0;
        
    end else begin
        
        if(!ASn && BGACKn) begin
            //debugging 
            // $display("time: %t, addr: %h, uds: %h, lds: %h, rw: %h, cpu_dout: %h, cpu_din: %h, sel_status: %b\n", $time/1000, addr_8, UDSn, LDSn, RW, cpu_dout, cpu_din, {sel_rom, sel_ram, sel_sram, sel_z80, sel_gp9001, sel_io});
             if(debug)
                $fwrite(fd, "time: %t, addr: %h, uds: %h, lds: %h, rw: %h, cpu_dout: %h, cpu_din: %h, sel_status: %b\n", $time/1000, addr_8, UDSn, LDSn, RW, cpu_dout, cpu_din, {sel_rom, sel_ram, sel_gp9001, sel_io});

            //68k ROM
            pre_sel_rom  <= addr_8 >= 0 && addr_8 <= 'h80000;

            CPU_PRG_ADDR <= A[19:1];

            //RAM
            pre_sel_ram <= addr_8[23:16] == 8'b0001_0000; // 0x100000 - 0x10FFFF 

            //GP9001
            sel_gp9001 <= addr_8[23:20] == 4'b0011; // 0x300000 - 0x30000D

            //direct access to vtx ram, no dma controller
            pre_sel_palram <= addr_8[23:20] == 4'b0100; // 0x400000 - 0x400FFF

            //IO
            sel_io <= addr_8[23:12] == 12'b0111_0000_0000; // 0x700034 - 0x700035

        end else begin
            pre_sel_rom<=0;
            pre_sel_ram<=0;
            pre_sel_palram<=0;
            sel_gp9001<=0;
            sel_io<=0;
        end
    end
end

// I/O
always @(*) begin
    //gp9001
    gp9001_vdp_device_r_cs = sel_gp9001 && RW; // 0x300000-D Read
    gp9001_vdp_device_w_cs = sel_gp9001 && !RW; // 0x300000-D Write

    //dips, controls, oki banking
    read_port_dswa_r_cs = sel_io && (addr_8[11:0] == 11'h004) && RW; // 0x700004-05
    read_port_dswb_r_cs = sel_io && (addr_8[11:0] == 11'h008) && RW; // 0x700008-09
    read_port_jmpr_r_cs = sel_io && (addr_8[11:0] == 11'h000) && RW; // 0x700000-01
    read_port_in1_r_cs = sel_io && (addr_8[11:0] == 11'h00C) && RW; // 0x70000C-0D
    read_port_in2_r_cs = sel_io && (addr_8[11:0] == 11'h010) && RW; // 0x700010-11
    read_port_in3_r_cs = sel_io && (addr_8[11:0] == 11'h014) && RW; // 0x700014-15
    read_port_in4_r_cs = sel_io && (addr_8[11:0] == 11'h018) && RW; // 0x700018-19
    read_port_sys_r_cs = sel_io && (addr_8[11:0] == 11'h01C) && RW; // 0x70001C-1D

    //coin
    toaplan2_coinword_w_cs = sel_io && (addr_8[11:0] == 11'h034); // 0x700034

    //sound
    sel_oki = (addr_8[23:20] == 'b0110); // 0x600001-01
    oki_bankswitch = sel_io && (addr_8[11:0] == 11'h030) && !LDSn && !RW; // 0x700031
end

wire [15:0] video_status_hs = (16'hFF00 & (!HSYNC ? ~16'h8000 : 16'hFFFF));
wire [15:0] video_status_vs = (16'hFF00 & (!VSYNC ? ~16'h4000 : 16'hFFFF));
wire [15:0] video_status_fb = (16'hFF00 & (!FBLANK ? ~16'h100 : 16'hFFFF));
wire [15:0] video_status = V < 256 ? (video_status_hs & video_status_vs & video_status_fb) | (V & 8'hFF) :
                                     (video_status_hs & video_status_vs & video_status_fb) | 8'hFF;
wire vint_n, int1;

//JTFRAME is low active, but Toaplan2 is high active.
wire [7:0] p1_ctrl = {1'b0, ~JOYSTICK1[5],~JOYSTICK1[4],~JOYSTICK1[0],~JOYSTICK1[1],~JOYSTICK1[2],~JOYSTICK1[3]};
wire [7:0] p2_ctrl = {1'b0, ~JOYSTICK2[5],~JOYSTICK2[4],~JOYSTICK2[0],~JOYSTICK2[1],~JOYSTICK2[2],~JOYSTICK2[3]};
wire [7:0] p3_ctrl = {~JOYSTICK3[6],~JOYSTICK3[5],~JOYSTICK3[4],~JOYSTICK3[0],~JOYSTICK3[1],~JOYSTICK3[2],~JOYSTICK3[3]};
wire [7:0] p4_ctrl = {~JOYSTICK4[6],~JOYSTICK4[5],~JOYSTICK4[4],~JOYSTICK4[0],~JOYSTICK4[1],~JOYSTICK4[2],~JOYSTICK4[3]};

always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) cpu_din <= 16'h0000;
    else begin
        cpu_din <= sel_gp9001 && RW ? GP9001_DOUT : //gcu
                   sel_rom ? CPU_PRG_DATA : //cpu program

                   //todo: ram hookups
                   sel_ram && RW ? main_ram_q0 ://ram reads
                   sel_palram && RW ? main_palram_q0 :
                   gp9001_vdp_device_r_cs && addr_8[3:0] == 'b1100 ? {15'b0, ~int1} : //VBLANK reg

                   read_port_in1_r_cs ? {2{p1_ctrl}} : //controller inputs
                   read_port_in2_r_cs ? {2{p2_ctrl}} :
                   read_port_in3_r_cs ? {2{p3_ctrl}} :
                   read_port_in4_r_cs ? {2{p4_ctrl}} :
                   read_port_sys_r_cs ? {2{DIPSW_C, 1'b0, ~START_BUTTON[1], ~START_BUTTON[0], ~COIN_INPUT[1], ~COIN_INPUT[0], ~DIP_TEST, 1'b0, ~SERVICE}} :
                   read_port_dswa_r_cs ? {2{DIPSW_A}} :
                   read_port_dswb_r_cs ? {2{DIPSW_B}} :
                   read_port_jmpr_r_cs ? {2{DIPSW_C}} :
                   video_count_r_cs ? video_status : // blanking trigger
                   toaplan2_coinword_w_cs ? 16'h0000 : //ignore coin counter.

                   sel_oki && RW ? {2{OKI_DOUT}} :
                   YM2151_CS && RW && A[1] ? {2{YM2151_DOUT}} :
                   16'h0000; //etc.
    end
end

//cpu bus actions for IO
wire inta_n = ~&{ FC0, FC1, FC2, A[19:16] }; // ctrl like M68000's manual

always @(posedge CLK96) begin
    if(RESET96) begin
        GP9001_OP_SELECT_REG <= 1'b0;
        GP9001_OP_WRITE_REG <= 1'b0;
        GP9001_OP_WRITE_RAM <= 1'b0;
        GP9001_OP_READ_RAM_H <= 1'b0;
        GP9001_OP_READ_RAM_L <= 1'b0;
        GP9001_OP_SET_RAM_PTR <= 1'b0;
        OKI_BANK<=0;
    end else begin
        if(oki_bankswitch && !RW) begin
            OKI_BANK <= cpu_dout[0];
        end
        else if(gp9001_vdp_device_r_cs) begin
            case(addr_8[3:0])
                4'b0100: GP9001_OP_READ_RAM_H <= 1'b1; //4
                4'b0110: GP9001_OP_READ_RAM_L <= 1'b1; //6
            endcase
        end
        else if(gp9001_vdp_device_w_cs) begin
            case(addr_8[3:0])
                4'b1100: GP9001_OP_WRITE_REG <= 1'b1; //0
                4'b1000: GP9001_OP_SELECT_REG <= 1'b1; //8
                4'b0100, 4'b0110: GP9001_OP_WRITE_RAM <= 1'b1; //4 or 6
                4'b0000: GP9001_OP_SET_RAM_PTR <= 1'b1; //0
            endcase
        end
        else begin
            if(GP9001ACK) begin
                GP9001_OP_SELECT_REG <= 1'b0;
                GP9001_OP_WRITE_REG <= 1'b0;
                GP9001_OP_WRITE_RAM <= 1'b0;
                GP9001_OP_READ_RAM_H <= 1'b0;
                GP9001_OP_READ_RAM_L <= 1'b0;
                GP9001_OP_SET_RAM_PTR <= 1'b0;
            end
        end
    end
end

//address bits 19 to 23 go to the E68DEC1B chip.

jtframe_ff u_int_ff(
    .clk      ( CLK96   ),
    .rst      ( RESET96 ),
    .cen      ( 1'b1    ),
    .din      ( 1'b1    ),
    .q        (         ),
    .qn       ( vint_n  ),
    .set      ( 1'b0    ),    // active high
    .clr      ( ~inta_n ),    // active high
    .sigedge  ( VINT    )     // signal whose edge will trigger the FF
);

jtframe_virq u_virq(
    .rst        ( RESET96   ),
    .clk        ( CLK96     ),
    .LVBL       ( LVBL      ),
    .dip_pause  ( DIP_PAUSE ),
    .skip_en    (           ),
    .skip_but   (           ),
    .clr        ( ~inta_n   ),
    .custom_in  (           ),
    .blin_n     ( int1      ),
    .blout_n    (           ),
    .custom_n   (           )
);

//68k cpu running at 16mhz
jtframe_68kdtack #(.W(8)) u_dtack(
    .rst        ( RESET96      ),
    .clk        ( CLK96        ),
    .cpu_cen    ( CEN16        ),
    .cpu_cenb   ( CEN16B       ),
    .bus_cs     ( bus_cs       ),
    .bus_busy   ( bus_busy     ),
    .bus_legit  ( 1'b0         ),
    .ASn        ( ASn          ),
    .DSn        ( {UDSn, LDSn} ),
    .num        ( 7'd32        ),
    .den        ( 8'd189       ),
    .DTACKn     ( DTACKn       ),
    // unused
    .fave       (              ),
    .fworst     (              ),
    .frst       (              )
);

assign BUSACK = ~BGACKn;

jtframe_68kdma #(.BW(1)) u_arbitration(
    .clk        ( CLK96   ),
    .cen        ( CEN16   ),
    .rst        ( RESET96 ),
    .cpu_BRn    ( BRn     ),
    .cpu_BGACKn ( BGACKn  ),
    .cpu_BGn    ( BGn     ),
    .cpu_ASn    ( ASn     ),
    .cpu_DTACKn ( DTACKn  ),
    .dev_br     ( BR      )
);

fx68k u_011 (
    .clk        ( CLK96     ),
    .extReset   ( RESET96   ),
    .pwrUp      ( RESET96   ),
    .enPhi1     ( CEN16     ),
    .enPhi2     ( CEN16B    ),

    // Buses
    .eab        ( A         ),
    .iEdb       ( cpu_din   ),
    .oEdb       ( cpu_dout  ),

    .eRWn       ( RW        ),
    .LDSn       ( LDSn      ),
    .UDSn       ( UDSn      ),
    .ASn        ( ASn       ),
    .VPAn       ( VPAn      ),
    .FC0        ( FC0       ),
    .FC1        ( FC1       ),
    .FC2        ( FC2       ),

    .BERRn      ( 1'b1      ),

    .HALTn      ( DIP_PAUSE ),
    .BRn        ( BRn       ),
    .BGACKn     ( BGACKn    ),
    .BGn        ( BGn       ),

    .DTACKn     ( DTACKn    ),
    .IPL0n      ( 1'b1      ),
    .IPL1n      ( 1'b1      ),
    .IPL2n      ( int1      ),

    // Unused
    .oRESETn    (           ),
    .oHALTEDn   (           ),
    .VMAn       (           ),
    .E          (           )
);

//CPU WRAM 0x100000-0x10FFFF
jtframe_dual_ram16 #(.aw(15)) u_cpu_wram(
    .clk0(CLK96),
    .clk1(CLK96),
    // Port 0 writes & reads from 68k
    .data0(wram_cpu_data),
    .addr0(A[15:1]),
    .we0({sel_ram && !RW && !UDSn, sel_ram && !RW && !LDSn}),
    .q0(),
    // Port 1
    .data1(),
    .addr1(A[15:1]),
    .we1(2'b00),
    .q1(main_ram_q0)
);

//Palette RAM 0x400000 - 0x400FFF
jtframe_dual_ram16 #(.aw(11)) u_palram_ram(
    .clk0(CLK96),
    .clk1(CLK96),
    // Port 0 writes
    .data0(wram_cpu_data),
    .addr0(A[11:1]),
    .we0({sel_palram && !RW && !UDSn, sel_palram && !RW && !LDSn}),
    .q0(main_palram_q0),
    // Port 1
    .data1(),
    .addr1(PALRAM_ADDR),
    .we1(2'b00),
    .q1(PALRAM_DATA)
);

endmodule