// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module test;

reg  rst;
wire irq;
reg  clk, cen=1'b0;


wire ss = 1'b1;
wire [17:0] rom_addr;
reg  [17:0] rom_last;
reg  [ 7:0] rom_data;
wire        rom_ok = rom_last === rom_addr;
wire signed [13:0] sound;
reg         wrn=1'b1;
reg  [ 7:0] din;
wire [ 7:0] dout;
reg  [ 7:0] rom[0:262143];

always @(posedge clk) begin
    rom_last <= rom_addr;
    rom_data <= rom[rom_addr];
end

jt6295 uut(
    .rst        ( rst       ),
    .clk        ( clk       ),
    .cen        ( cen       ),
    .ss         ( ss        ),
    // CPU interface
    .wrn        ( wrn       ),  // active low
    .din        ( din       ),
    .dout       ( dout      ),
    // ROM interface
    .rom_addr   ( rom_addr  ),
    .rom_data   ( rom_data  ),
    .rom_ok     ( rom_ok    ),
    // Sound output
    .sound      ( sound     )
);

initial begin
    clk=1'b0;
    forever #118.371 clk=~clk;
end

integer f, fcnt;

initial begin
    f=$fopen("rom.bin","rb");
    fcnt=$fread(rom,f);
    $fclose(f);
end

initial begin
    rst = 1'b0;
    #150 rst=1'b1;
    #750 rst=1'b0;
end

integer cnt=0, wrst=0, aux;

reg [7:0] cmd[0:127];
reg [6:0] subcnt;

initial begin
    for( aux=0; aux<128; aux=aux+1) cmd[aux] = 8'd0; // wait

    cmd[0] = 8'h78; // suspend all channels
    //cmd[1] = 8'h81; // phrase 1
    cmd[2] = 8'hc3; // phrase 17
    cmd[3] = 8'h13; // channel 1

    cmd[90] = 8'h01; // finish
end

always @(posedge clk, posedge rst) begin
    if(rst) begin
        wrst <= 0;
        din  <= 8'd0;
        cnt  <= 0;
        subcnt<=0;
        wrn  <= 1;
    end else begin
        case( wrst )
            0: begin
                case( cmd[cnt] )
                    8'h00: wrst <= 9;
                    8'h01: wrst <= 10;
                    default: begin
                        wrn  <= 1'b0;
                        din  <= cmd[cnt];
                        wrst <= 1;
                    end
                endcase
            end
            1: begin
                subcnt<=subcnt+1;
                wrst <= 0;
                if(&subcnt) begin
                    cnt <= cnt+1;
                    wrn <= 1'b1;
                end
            end

            9: begin   // wait
                cnt <= cnt+1;
                #20_00_000 wrst <= 0;
            end
            10: #10_000 $finish;
        endcase
    end
end

integer cen_cnt=0;

always @(posedge clk) begin
    cen <= 1'b0;
    if(cen_cnt==0) cen<=1'b1;
    cen_cnt <= cen_cnt==0 ? 3 : (cen_cnt-1);
end

//`ifdef DUMP
`ifndef NCVERILOG
    initial begin
        $dumpfile("test.lxt");
        $dumpvars(0,test);
        $dumpon;
    end
`else
    initial begin
        $shm_open("test.shm");
        $shm_probe(test,"AS");
    end
`endif
//`endif

endmodule