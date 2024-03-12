`timescale 1ns/100ps
module test();

reg rst_in_n;
reg clk_in;
reg clk_uart_in;


wire[31:0] base_ram_data;
wire[19:0] base_ram_address;
wire base_ram_we_n;
wire base_ram_oe_n;
wire base_ram_ce_n;

wire[31:0] ext_ram_data;
wire[19:0] ext_ram_address;
wire ext_ram_we_n;
wire ext_ram_oe_n;
wire ext_ram_ce_n;

wire[15:0] flash_data;
wire[21:0] flash_address;
wire flash_rp_n;
wire flash_vpen;
wire flash_oe_n;
wire[2:0] flash_ce;
wire flash_byte_n;
wire flash_we_n;

reg rxd;
wire txd;

tri[31:0] gpio0;
tri[31:0] gpio1;

tri[31:0] ext_data;

soc_toplevel soc(/*autoinst*/
           .base_ram_data(base_ram_data),
           .base_ram_addr(base_ram_address),
           .base_ram_ce_n(base_ram_ce_n),
           .base_ram_oe_n(base_ram_oe_n),
           .base_ram_we_n(base_ram_we_n),
           .ext_ram_data(ext_ram_data),
           .ext_ram_addr(ext_ram_address),
           .ext_ram_ce_n(ext_ram_ce_n),
           .ext_ram_oe_n(ext_ram_oe_n),
           .ext_ram_we_n(ext_ram_we_n),
           .rst_in_n(rst_in_n),
           .clk_in(clk_in),
           .clk_uart_in(clk_uart_in),
           .flash_data(flash_data),
           .flash_address(flash_address),
           .flash_rp_n(flash_rp_n),
           .flash_vpen(flash_vpen),
           .flash_oe_n(flash_oe_n),
           .flash_ce(flash_ce),
           .flash_byte_n(flash_byte_n),
           .flash_we_n(flash_we_n),
           .txd(txd),
           .rxd(rxd),
           .gpio0(gpio0),
           .gpio1(gpio1));
AS7C34098A base1(/*autoinst*/
            .DataIO(base_ram_data[15:0]),
            .Address(base_ram_address[17:0]),
            .OE_n(base_ram_oe_n),
            .CE_n(base_ram_ce_n),
            .WE_n(base_ram_we_n),
            .LB_n(1'b0),
            .UB_n(1'b0));
AS7C34098A base2(/*autoinst*/
            .DataIO(base_ram_data[31:16]),
            .Address(base_ram_address[17:0]),
            .OE_n(base_ram_oe_n),
            .CE_n(base_ram_ce_n),
            .WE_n(base_ram_we_n),
            .LB_n(1'b0),
            .UB_n(1'b0));
AS7C34098A ext1(/*autoinst*/
            .DataIO(ext_ram_data[15:0]),
            .Address(ext_ram_address[17:0]),
            .OE_n(ext_ram_oe_n),
            .CE_n(ext_ram_ce_n),
            .WE_n(ext_ram_we_n),
            .LB_n(1'b0),
            .UB_n(1'b0));
AS7C34098A ext2(/*autoinst*/
            .DataIO(ext_ram_data[31:16]),
            .Address(ext_ram_address[17:0]),
            .OE_n(ext_ram_oe_n),
            .CE_n(ext_ram_ce_n),
            .WE_n(ext_ram_we_n),
            .LB_n(1'b0),
            .UB_n(1'b0));
s29gl064n01 flash(
    .A21      (flash_address[21]),
    .A20      (flash_address[20]),
    .A19      (flash_address[19]),
    .A18      (flash_address[18]),
    .A17      (flash_address[17]),
    .A16      (flash_address[16]),
    .A15      (flash_address[15]),
    .A14      (flash_address[14]),
    .A13      (flash_address[13]),
    .A12      (flash_address[12]),
    .A11      (flash_address[11]),
    .A10      (flash_address[10]),
    .A9       (flash_address[9]),
    .A8       (flash_address[8]),
    .A7       (flash_address[7]),
    .A6       (flash_address[6]),
    .A5       (flash_address[5]),
    .A4       (flash_address[4]),
    .A3       (flash_address[3]),
    .A2       (flash_address[2]),
    .A1       (flash_address[1]),
    .A0       (flash_address[0]),

    .DQ15     (flash_data[15]),
    .DQ14     (flash_data[14]),
    .DQ13     (flash_data[13]),
    .DQ12     (flash_data[12]),
    .DQ11     (flash_data[11]),
    .DQ10     (flash_data[10]),
    .DQ9      (flash_data[9]),
    .DQ8      (flash_data[8]),
    .DQ7      (flash_data[7]),
    .DQ6      (flash_data[6]),
    .DQ5      (flash_data[5]),
    .DQ4      (flash_data[4]),
    .DQ3      (flash_data[3]),
    .DQ2      (flash_data[2]),
    .DQ1      (flash_data[1]),
    .DQ0      (flash_data[0]),

    .CENeg    (flash_ce[0]),
    .OENeg    (flash_oe_n),
    .WENeg    (flash_we_n),
    .RESETNeg (flash_rp_n),
    .WPNeg    (flash_vpen),
    .BYTENeg  (flash_byte_n),
    .RY()
);

defparam flash.UserPreload = 1'b1;
defparam flash.mem_file_name = "flash_preload.mem";
defparam flash.TimingModel = "S29GL064N11TFIV2";

defparam soc.uart0.rx1.COUNTER_PERIOD=3;
defparam soc.uart0.tx1.COUNTER_PERIOD=3;

defparam soc.uart0.tx1.ignore_for_sim=1;
defparam soc.cpu.pc_instance.PC_INITIAL = 32'h80000000;

defparam soc.cpu.dbg_host.tx_dbg.ignore_for_sim=1;

task uart_send_byte;
input [7:0] data;
begin
    soc.uart0.rx1.rx_avai_for_sim = 1'b1;
    soc.uart0.rx1.rx_data_for_sim = data;
    #45;
    soc.uart0.rx1.rx_avai_for_sim = 1'b0;
    #700;
    // rxd = 1'b0;
    // #361;
    // repeat(8) begin
    //     rxd = data[0];
    //     #361;
    //     data = data>>1;
    // end
    // rxd = 1'b1;
    // #361;
end
endtask

task uart_send_word;
input [31:0] data;
begin
    uart_send_byte(data[7:0]);
    uart_send_byte(data[15:8]);
    uart_send_byte(data[23:16]);
    uart_send_byte(data[31:24]);
end
endtask

task debugger_send_byte;
input [7:0] data;
begin
    @(negedge soc.cpu.dbg_host.clk);
    soc.cpu.dbg_host.rx_dbg.rx_avai_for_sim = 1'b1;
    soc.cpu.dbg_host.rx_dbg.rx_data_for_sim = data;
    @(negedge soc.cpu.dbg_host.clk);
    soc.cpu.dbg_host.rx_dbg.rx_avai_for_sim = 1'b0;
    @(negedge soc.cpu.dbg_host.clk);
end
endtask

task debugger_send_word;
input [31:0] data;
begin
    debugger_send_byte(data[7:0]);
    debugger_send_byte(data[15:8]);
    debugger_send_byte(data[23:16]);
    debugger_send_byte(data[31:24]);
end
endtask

// assign gpio0 = 32'h0;
assign gpio1 = 32'h1;

initial begin
    rst_in_n=1'b0;
    clk_in=1'b0;
    clk_uart_in=1'b0;
    rxd = 1'b1;
    #41 rst_in_n=1'b1;
end

/*
initial begin
    wait(soc.rst_n == 1'b1);
    #1000;
    uart_send_byte(8'h30);
    #200;
    uart_send_word(32'h00005566);
    uart_send_word(32'h00000001);
    // uart_send_word(32'haabbccdd);
    uart_send_word(32'h3403eeff);
    #600;
    uart_send_byte(8'h31);
    #200;
    uart_send_word(32'h00005566);
    uart_send_word(32'h00000001);
    #600;

    uart_send_byte(8'h34);
    #200;
    uart_send_word(32'h00005566);
end
*/
/*
initial begin 
    wait(soc.rst_n == 1'b1);
    debugger_send_byte(8'h85); //CMD_SET_BP
    debugger_send_word(32'h8000002c);
    #800;
    debugger_send_byte(8'he); //CMD_QUERY
    #800;
    debugger_send_byte(8'd3); //CMD_EN_BP
    #800;
    debugger_send_byte(8'he); //CMD_QUERY
    #800;
    debugger_send_byte(8'h8c); //CMD_READ_IMEM
    debugger_send_word(32'h80000004);
    #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'he); //CMD_QUERY
    #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'ha); //CMD_READ_PC
    #800;
    debugger_send_byte(8'd4); //CMD_DIS_BP
    #800;
    // debugger_send_byte(8'hb); //CMD_RESET
    // #800;
    debugger_send_byte(8'hd); //CMD_STEP
    #800;
    debugger_send_byte(8'ha); //CMD_READ_PC
    #800;
    debugger_send_byte(8'd2); //CMD_CONT
    #800;
    debugger_send_byte(8'h86); //CMD_READ_REG
    debugger_send_word(32'h8);
    #800;
    debugger_send_byte(8'h86); //CMD_READ_REG
    debugger_send_word(32'h8);
    #800;
    debugger_send_byte(8'd3); //CMD_EN_BP
    #800;
end
*/

initial begin
    $readmemh("ram_preload.mem.0", base1.mem_array0);
    $readmemh("ram_preload.mem.1", base1.mem_array1);
    $readmemh("ram_preload.mem.2", base2.mem_array0);
    $readmemh("ram_preload.mem.3", base2.mem_array1);
end


always begin
    #10 clk_in = ~clk_in; //50MHz clock in
end

always #45 clk_uart_in = ~clk_uart_in; //11.0592Mhz

endmodule
