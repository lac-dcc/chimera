
//--------------------------------------------------------------------------------------------------------
// Module  : tb_sha
// Type    : simulation, top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: testbench for   sha1.v   sha224.v   sha256.v   sha384.v   sha512.v
//--------------------------------------------------------------------------------------------------------

`timescale 1ps/1ps

module tb_sha ();

initial $dumpvars(1, tb_sha);

reg rstn = 1'b0;
reg clk = 1'b1;
always #5000 clk = ~clk;   // 100MHz



reg          tvalid = 1'b0;
reg          tlast  = 1'b0;
reg  [ 31:0] tid    = 0;
reg  [  7:0] tdata  = 8'd0;

wire         tready_sha1;
wire         tready_sha224;
wire         tready_sha256;
wire         tready_sha384;
wire         tready_sha512;

wire         tready = tready_sha1 & tready_sha224 & tready_sha256 & tready_sha384 & tready_sha512;

wire         ovalid_sha1;
wire [ 31:0] oid_sha1;
wire [ 60:0] olen_sha1;
wire [159:0] osha1;

wire         ovalid_sha224;
wire [ 31:0] oid_sha224;
wire [ 60:0] olen_sha224;
wire [223:0] osha224;

wire         ovalid_sha256;
wire [ 31:0] oid_sha256;
wire [ 60:0] olen_sha256;
wire [255:0] osha256;

wire         ovalid_sha384;
wire [ 31:0] oid_sha384;
wire [ 60:0] olen_sha384;
wire [383:0] osha384;

wire         ovalid_sha512;
wire [ 31:0] oid_sha512;
wire [ 60:0] olen_sha512;
wire [511:0] osha512;


sha1 u_sha1 (
    .rstn   ( rstn          ),
    .clk    ( clk           ),
    .tready ( tready_sha1   ),
    .tvalid ( tvalid        ),
    .tlast  ( tlast         ),
    .tid    ( tid           ),
    .tdata  ( tdata         ),
    .ovalid ( ovalid_sha1   ),
    .oid    ( oid_sha1      ),
    .olen   ( olen_sha1     ),
    .osha   ( osha1         )
);

sha224 u_sha224 (
    .rstn   ( rstn          ),
    .clk    ( clk           ),
    .tready ( tready_sha224 ),
    .tvalid ( tvalid        ),
    .tlast  ( tlast         ),
    .tid    ( tid           ),
    .tdata  ( tdata         ),
    .ovalid ( ovalid_sha224 ),
    .oid    ( oid_sha224    ),
    .olen   ( olen_sha224   ),
    .osha   ( osha224       )
);

sha256 u_sha256 (
    .rstn   ( rstn          ),
    .clk    ( clk           ),
    .tready ( tready_sha256 ),
    .tvalid ( tvalid        ),
    .tlast  ( tlast         ),
    .tid    ( tid           ),
    .tdata  ( tdata         ),
    .ovalid ( ovalid_sha256 ),
    .oid    ( oid_sha256    ),
    .olen   ( olen_sha256   ),
    .osha   ( osha256       )
);

sha384 u_sha384 (
    .rstn   ( rstn          ),
    .clk    ( clk           ),
    .tready ( tready_sha384 ),
    .tvalid ( tvalid        ),
    .tlast  ( tlast         ),
    .tid    ( tid           ),
    .tdata  ( tdata         ),
    .ovalid ( ovalid_sha384 ),
    .oid    ( oid_sha384    ),
    .olen   ( olen_sha384   ),
    .osha   ( osha384       )
);

sha512 u_sha512 (
    .rstn   ( rstn          ),
    .clk    ( clk           ),
    .tready ( tready_sha512 ),
    .tvalid ( tvalid        ),
    .tlast  ( tlast         ),
    .tid    ( tid           ),
    .tdata  ( tdata         ),
    .ovalid ( ovalid_sha512 ),
    .oid    ( oid_sha512    ),
    .olen   ( olen_sha512   ),
    .osha   ( osha512       )
);


always @ (posedge clk)
    if (ovalid_sha1)
        $display("id=%x   len=%6d   sha1  =%x", oid_sha1  , olen_sha1  , osha1  );

always @ (posedge clk)
    if (ovalid_sha224)
        $display("id=%x   len=%6d   sha224=%x", oid_sha224, olen_sha224, osha224);

always @ (posedge clk)
    if (ovalid_sha256)
        $display("id=%x   len=%6d   sha256=%x", oid_sha256, olen_sha256, osha256);

always @ (posedge clk)
    if (ovalid_sha384)
        $display("id=%x   len=%6d   sha384=%x", oid_sha384, olen_sha384, osha384);

always @ (posedge clk)
    if (ovalid_sha512)
        $display("id=%x   len=%6d   sha512=%x", oid_sha512, olen_sha512, osha512);




function  integer check_fopen;
    input integer fp;
begin
    if(fp == 0) begin
        $error("could not open file.\n");
        $finish;
    end
    check_fopen = fp;
end
endfunction



task push_file;
    input integer id;
    input integer fp;
    integer       rbyte;
begin
    {tvalid,tlast,tid,tdata} <= 0;
    @(posedge clk);
    while(~tready) @(posedge clk);
    tid <= id;
    tdata <= $fgetc(fp);
    rbyte = $fgetc(fp);
    tlast <= rbyte == -1;
    while( rbyte != -1 ) @(posedge clk) begin
        if(~tvalid | tready)
            tvalid <= ($random % 2) == 0;           // add random bubble
        if( tvalid & tready) begin
            tdata <= rbyte;
            rbyte  = $fgetc(fp);
            tlast <= rbyte == -1;
        end
    end
    tvalid <= 1'b1;
    while(~tready) @(posedge clk);
    @(posedge clk);
    {tvalid,tlast,tid,tdata} <= 0;
    $fclose(fp);
end
endtask



initial begin
    repeat(4) @(posedge clk);
    rstn <= 1'b1;
    push_file('h111, check_fopen($fopen("./test_data/test1.bin", "rb")));
    push_file('h222, check_fopen($fopen("./test_data/test2.bin", "rb")));
    push_file('h333, check_fopen($fopen("./test_data/test3.bin", "rb")));
    push_file('h444, check_fopen($fopen("./test_data/test4.bin", "rb")));
    push_file('h555, check_fopen($fopen("./test_data/test5.bin", "rb")));
    push_file('h666, check_fopen($fopen("./test_data/test6.bin", "rb")));
    push_file('h777, check_fopen($fopen("./test_data/test7.bin", "rb")));
    repeat(2000) @(posedge clk);
    $finish;
end


endmodule

