`timescale 1ns / 1ps
module cpld_model(
    input  wire clk_uart,         //内部串口时钟
    input  wire uart_rdn,         //读串口信号，低有效
    input  wire uart_wrn,         //写串口信号，低有效
    output reg uart_dataready,    //串口数据准备好
    output reg uart_tbre,         //发送数据标志
    output reg uart_tsre,         //数据发送完毕标志
    inout  wire [7:0]data
);
    reg bus_analyze_clk = 0;
    reg clk_out2_rst_n = 0, bus_analyze_clk_rst_n = 0;
    wire clk_out2;

    reg [7:0] TxD_data,TxD_data0,TxD_data1;
    reg [2:0] cpld_emu_wrn_sync;
    reg [2:0] cpld_emu_rdn_sync;
    reg [7:0] uart_rx_data;
    wire uart_rx_flag;
    reg wrn_rise;

    assign data = uart_rdn ? 8'bz : uart_rx_data;
    assign #3 clk_out2 = clk_uart;

    initial begin
        uart_tsre = 1;
        uart_tbre = 1;
        uart_dataready = 0;
        repeat(2) @(negedge clk_out2);
        clk_out2_rst_n = 1;
        @(negedge bus_analyze_clk);
        bus_analyze_clk_rst_n = 1;
    end

    always #2 bus_analyze_clk = ~bus_analyze_clk;

    always @(posedge bus_analyze_clk) begin : proc_Tx
        TxD_data0 <= data[7:0];
        TxD_data1 <= TxD_data0;

        cpld_emu_rdn_sync <= {cpld_emu_rdn_sync[1:0],uart_rdn};
        cpld_emu_wrn_sync <= {cpld_emu_wrn_sync[1:0],uart_wrn};

        if(~cpld_emu_wrn_sync[1] & cpld_emu_wrn_sync[2])
            TxD_data <= TxD_data1;
        wrn_rise <= cpld_emu_wrn_sync[1] & ~cpld_emu_wrn_sync[2];
        
        if(~cpld_emu_rdn_sync[1] & cpld_emu_rdn_sync[2]) //rdn_fall
            uart_dataready <= 1'b0;
        else if(uart_rx_flag)
            uart_dataready <= 1'b1;
    end

    reg [7:0] TxD_data_sync;
    wire tx_en;
    reg rx_ack = 0;

    always @(posedge clk_out2) begin
        TxD_data_sync <= TxD_data;
    end

    always @(posedge clk_out2 or negedge uart_wrn) begin : proc_tbre
        if(~uart_wrn) begin
            uart_tbre <= 0;
        end else if(!uart_tsre) begin
            uart_tbre <= 1;
        end
    end

    flag_sync_cpld tx_flag(
        .clkA        (bus_analyze_clk),
        .clkB        (clk_out2),
        .FlagIn_clkA (wrn_rise),
        .FlagOut_clkB(tx_en),
        .a_rst_n     (bus_analyze_clk_rst_n),
        .b_rst_n     (clk_out2_rst_n)
    );

    flag_sync_cpld rx_flag(
        .clkA        (clk_out2),
        .clkB        (bus_analyze_clk),
        .FlagIn_clkA (rx_ack),
        .FlagOut_clkB(uart_rx_flag),
        .a_rst_n     (bus_analyze_clk_rst_n),
        .b_rst_n     (clk_out2_rst_n)
    );

    always begin
        wait(tx_en == 1);
        repeat(2)
            @(posedge clk_out2);
        uart_tsre = 0;
        #10000 // 实际串口发送时间更长，为了加快仿真，等待时间较短
        $display("send: 0x%02x", TxD_data_sync);
        uart_tsre = 1;
    end

    task pc_send_byte;
    input [7:0] arg;
    begin
        uart_rx_data = arg;
        @(negedge clk_out2);
        rx_ack = 1;
        @(negedge clk_out2);
        rx_ack = 0;
    end
    endtask
endmodule