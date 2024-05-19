// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none
`timescale 1ns / 100ps

module tb ();

    initial begin
        $dumpfile("serv.vcd");
        $dumpvars(0, tb);
        #5000000 $finish;
    end

    reg ck = 0;

    always #42 ck <= !ck;

    localparam WORDS = 512;
    localparam WIDTH = $clog2(WORDS);

    wire wb_clk;

    assign wb_clk = ck;

    wire x_cyc;
    wire x_we;
    wire [3:0] x_sel;
    wire [31:0] x_adr;
    wire [31:0] x_dat;
    wire x_ack;
    wire [31:0] x_rdt;

    // Simulate a memory device ACKing on xbus

    reg x_busy = 0;

    always @(posedge wb_clk) begin
        if (x_cyc & !x_ack) begin
            x_busy <= 1;
        end
        if (x_busy) begin
            x_busy <= 0;
        end
    end

    assign x_ack = x_busy & x_cyc;

    sp_ram #(.WORDS(WORDS)) sp_ram (   
        .ck(wb_clk),
        .cyc(x_cyc),
        .we(x_we),
        .sel(x_sel),
        .addr(x_adr),
        .wdata(x_dat),
        .rdata(x_rdt)
    );

    assign x_ack = x_busy & x_cyc;

    reg  a_cyc = 0;
    reg  a_we = 0;
    reg  [3:0] a_sel = 0;
    reg  [31:0] a_adr = 0;
    reg  [31:0] a_dat = 0;

    reg  b_cyc = 0;
    reg  b_we = 0;
    reg  [3:0] b_sel = 0;
    reg  [31:0] b_adr = 0;
    reg  [31:0] b_dat = 0;

    wire a_ack;
    wire [31:0] a_rdt;
    wire b_ack;
    wire [31:0] b_rdt;

    ram_arb #(.WIDTH(32))
    ram_arb (
        .wb_clk(wb_clk),
        .a_cyc(a_cyc),
        .a_we(a_we),
        .a_sel(a_sel),
        .a_adr(a_adr),
        .a_dat(a_dat),
        .a_ack(a_ack),
        .a_rdt(a_rdt),
        .b_cyc(b_cyc),
        .b_we(b_we),
        .b_sel(b_sel),
        .b_adr(b_adr),
        .b_dat(b_dat),
        .b_ack(b_ack),
        .b_rdt(b_rdt),
        .x_cyc(x_cyc),
        .x_we(x_we),
        .x_sel(x_sel),
        .x_adr(x_adr),
        .x_dat(x_dat),
        .x_ack(x_ack),
        .x_rdt(x_rdt)
    );

    reg [31:0] rd_a = 0;
    reg [31:0] rd_b = 0;

    always @(posedge wb_clk) begin
        if (a_ack) begin
            a_cyc <= 0;
            a_adr <= 32'hZ;
            a_dat <= 32'hZ;
            a_we <= 0;
            a_sel <= 0;
            if (!a_we) begin
                rd_a <= a_rdt;
            end
        end
        if (b_ack) begin
            b_cyc <= 0;
            b_adr <= 32'hZ;
            b_dat <= 32'hZ;
            b_we <= 0;
            b_sel <= 0;
            if (!b_we) begin
                rd_b <= b_rdt;
            end
        end
    end

    task write_a(input [31:0] addr, input [31:0] data, input [3:0] sel);

        begin
            a_adr <= addr;
            a_dat <= data;
            a_we <= 1;
            a_sel <= sel;
            a_cyc <= 1;
        end

    endtask

    task read_a(input [31:0] addr);

        begin
            a_adr <= addr;
            a_we <= 0;
            a_sel = 0;
            a_cyc <= 1;
        end

    endtask

    task write_b(input [31:0] addr, input [31:0] data, input [3:0] sel);

        begin
            b_adr <= addr;
            b_dat <= data;
            b_we <= 1;
            b_sel <= sel;
            b_cyc <= 1;
        end

    endtask

    task read_b(input [31:0] addr);

        begin
            b_adr <= addr;
            b_we <= 0;
            b_sel = 0;
            b_cyc <= 1;
        end

    endtask

    // check for *_rdt errors
    always @(posedge wb_clk) begin
        if (!a_cyc) begin
            tb_assert(a_rdt == 0);
        end
        if (!b_cyc) begin
            tb_assert(b_rdt == 0);
        end
    end

    task check_a(input [31:0] addr, input [31:0] data);

        begin
            
            read_a(addr);
            @(posedge wb_clk);
            wait(!a_cyc);
            @(posedge wb_clk);
            tb_assert(rd_a == data);

        end

    endtask

    task check_b(input [31:0] addr, input [31:0] data);

        begin
            
            read_b(addr);
            @(posedge wb_clk);
            wait(!b_cyc);
            @(posedge wb_clk);
            tb_assert(rd_b == data);

        end

    endtask

    integer addr = 0;

    initial begin

        @(posedge wb_clk);

        write_a(32'h0000_0020, 32'h1234_3456, 4'b1111);
        @(posedge wb_clk);

        // check that x_bus sees the signals
        tb_assert(x_cyc);
        tb_assert(x_we);
        tb_assert(x_sel == 4'b1111);
        tb_assert(x_adr == 32'h0000_0020);
        tb_assert(x_dat == 32'h1234_3456);

        // wait for a_ack : x_bus still valid
        wait(a_ack);
        tb_assert(x_cyc);
        tb_assert(x_we);
        tb_assert(x_sel == 4'b1111);
        tb_assert(x_adr == 32'h0000_0020);
        tb_assert(x_dat == 32'h1234_3456);

        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(x_ack == 0);
        tb_assert(x_cyc == 0);
        tb_assert(x_we == 0);
        tb_assert(x_sel == 0);
        tb_assert(x_adr == 0);
        tb_assert(x_dat == 0);

        write_b(32'h0000_0010, 32'hcafe_cafe, 4'b1111);
        @(posedge wb_clk);
        // check that x_bus sees the signals
        tb_assert(x_cyc);
        tb_assert(x_we);
        tb_assert(x_sel == 4'b1111);
        tb_assert(x_adr == 32'h0000_0010);
        tb_assert(x_dat == 32'hcafe_cafe);

        // wait for b_ack : x_bus still valid
        wait(b_ack);
        tb_assert(x_cyc);
        tb_assert(x_we);
        tb_assert(x_sel == 4'b1111);
        tb_assert(x_adr == 32'h0000_0010);
        tb_assert(x_dat == 32'hcafe_cafe);

        wait(!b_cyc);
        @(posedge wb_clk);
        tb_assert(x_ack == 0);
        tb_assert(x_cyc == 0);
        tb_assert(x_we == 0);
        tb_assert(x_sel == 0);
        tb_assert(x_adr == 0);
        tb_assert(x_dat == 0);

        check_a(32'h0000_0020, 32'h1234_3456);
        check_a(32'h0000_0010, 32'hcafe_cafe);
        check_b(32'h0000_0020, 32'h1234_3456);
        check_b(32'h0000_0010, 32'hcafe_cafe);

        // Test overlapping writes

        // A before B
        write_a(32'h0000_0028, 32'h08080808, 4'b1111);
        @(posedge wb_clk);
        write_b(32'h0000_0024, 32'h04040404, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        check_a(32'h0000_0028, 32'h08080808);
        check_a(32'h0000_0024, 32'h04040404);

        // A and B together
        write_a(32'h0000_0000, 32'h12341234, 4'b1111);
        write_b(32'h0000_0004, 32'habcdabcd, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        @(posedge wb_clk);
        check_a(32'h0000_0000, 32'h12341234);
        check_a(32'h0000_0004, 32'habcdabcd);

        // A and B writing to the same location
        write_a(32'h0000_0008, 32'h12341234, 4'b1111);
        write_b(32'h0000_0008, 32'habcdabcd, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        @(posedge wb_clk);
        // A goes first, B overwrites data
        check_a(32'h0000_0008, 32'habcdabcd);

        // B before A
        write_b(32'h0000_0004, 32'hcafecafe, 4'b1111);
        @(posedge wb_clk);
        write_a(32'h0000_0000, 32'h34563456, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        @(posedge wb_clk);
        check_a(32'h0000_0004, 32'hcafecafe);
        check_a(32'h0000_0000, 32'h34563456);

        // B 2 before A
        write_b(32'h0000_0004, 32'h23232323, 4'b1111);
        @(posedge wb_clk);
        @(posedge wb_clk);
        write_a(32'h0000_0000, 32'h56565656, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        @(posedge wb_clk);
        check_a(32'h0000_0004, 32'h23232323);
        check_b(32'h0000_0000, 32'h56565656);

        // A 2 before B
        write_a(32'h0000_0004, 32'h78787878, 4'b1111);
        @(posedge wb_clk);
        @(posedge wb_clk);
        write_b(32'h0000_0000, 32'h12341234, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        @(posedge wb_clk);
        check_a(32'h0000_0004, 32'h78787878);
        check_b(32'h0000_0000, 32'h12341234);

        // Now try staged reads
        
        // Add some test data
        write_a(32'h0000_0000, 32'h00000000, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        write_a(32'h0000_0004, 32'h11111111, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        write_a(32'h0000_0008, 32'h22222222, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        write_a(32'h0000_000c, 32'h44444444, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);

        // A 2 before B
        read_a(32'h0000_0000);
        @(posedge wb_clk);
        @(posedge wb_clk);
        read_b(32'h0000_0004);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(rd_a == 32'h00000000);
        wait(!b_cyc);
        @(posedge wb_clk);
        tb_assert(rd_b == 32'h11111111);

        // A 1 before B
        read_a(32'h0000_0004);
        @(posedge wb_clk);
        read_b(32'h0000_0000);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(rd_a == 32'h11111111);
        wait(!b_cyc);
        @(posedge wb_clk);
        tb_assert(rd_b == 32'h00000000);

        // A and B together
        read_a(32'h0000_0000);
        read_b(32'h0000_0004);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(rd_a == 32'h00000000);
        wait(!b_cyc);
        @(posedge wb_clk);
        tb_assert(rd_b == 32'h11111111);

        // B 1 before A
        read_b(32'h0000_0008);
        @(posedge wb_clk);
        read_a(32'h0000_000c);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(rd_a == 32'h44444444);
        wait(!b_cyc);
        @(posedge wb_clk);
        tb_assert(rd_b == 32'h22222222);

        // B 2 before A
        read_b(32'h0000_0000);
        @(posedge wb_clk);
        @(posedge wb_clk);
        read_a(32'h0000_0004);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(rd_a == 32'h11111111);
        wait(!b_cyc);
        @(posedge wb_clk);
        tb_assert(rd_b == 32'h00000000);

        // Now try mixing reads and writes

        // read A 2 before write B
        read_a(32'h0000_0008);
        @(posedge wb_clk);
        @(posedge wb_clk);
        write_b(32'h0000_0010, 32'h44444444, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        tb_assert(rd_a == 32'h22222222);

        // read A 1 before write B
        read_a(32'h0000_0008);
        @(posedge wb_clk);
        write_b(32'h0000_0010, 32'h44444444, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        tb_assert(rd_a == 32'h22222222);
        @(posedge wb_clk);
        check_a(32'h0000_0010, 32'h44444444);

        // read A same time as write B
        read_a(32'h0000_0008);
        write_b(32'h0000_0014, 32'hfaceface, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        tb_assert(rd_a == 32'h22222222);
        @(posedge wb_clk);
        check_a(32'h0000_0014, 32'hfaceface);

        // read A same time as write B, same address
        // A gets priority, so read should happen first.
        // a second read will get the updated value.
        read_a(32'h0000_0014);
        write_b(32'h0000_0014, 32'h12345678, 4'b1111);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        tb_assert(rd_a == 32'hfaceface);
        @(posedge wb_clk);
        check_a(32'h0000_0014, 32'h12345678);

        // write B 1 before read A, same address
        write_b(32'h0000_0010, 32'h12345678, 4'b1111);
        @(posedge wb_clk);
        read_a(32'h0000_0010);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        tb_assert(rd_a == 32'h12345678);
        @(posedge wb_clk);
        @(posedge wb_clk);

        // Ensure that byte and word writes work correctly

        // Test byte writes
        addr = 32'h0000_0014;
        write_a(addr, 32'hxxxxxxab, 4'b0001);
        write_b(addr, 32'hxxxxcdxx, 4'b0010);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        read_a(addr);
        @(posedge wb_clk);
        wait(!b_cyc);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert((rd_a & 32'h0000ffff) == 32'h0000cdab);
        @(posedge wb_clk);

        write_a(32'h0000_0014, 32'hxxfexxxx, 4'b0100);
        write_b(32'h0000_0014, 32'hcaxxxxxx, 4'b1000);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        read_a(32'h0000_0014);
        @(posedge wb_clk);
        wait(!a_cyc);
        wait(!b_cyc);
        tb_assert(rd_a == 32'hcafecdab);
        @(posedge wb_clk);

        // Test word writes
        write_a(addr, 32'hxxxx1234, 4'b0011);
        write_b(addr, 32'habcdxxxx, 4'b1100);
        @(posedge wb_clk);
        wait(!a_cyc);
        @(posedge wb_clk);
        read_a(addr);
        @(posedge wb_clk);
        wait(!b_cyc);
        wait(!a_cyc);
        @(posedge wb_clk);
        tb_assert(32'habcd1234);

        $display("done");
    end

endmodule

