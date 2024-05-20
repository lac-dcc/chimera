// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

`timescale 1ns/1ns

module uart_cmd(
    Clk,
    Reset_n,
    rx_data,
    rx_done,
    address,
    data,
    num_cmd,
    cmdvalid
);
    
    input Clk;
    input Reset_n;
    input [7:0]rx_data;
    input rx_done;
    output reg[15:0]address;
    output reg[127:0]data;
    output reg cmdvalid;
    output reg [7:0]num_cmd;
    
    reg [7:0] data_str [21:0];
    always@(posedge Clk)
    if(rx_done)begin
        data_str[21] <= #1 rx_data;
        data_str[20] <= #1 data_str[21];
        data_str[19] <= #1 data_str[20];
        data_str[18] <= #1 data_str[19];
        data_str[17] <= #1 data_str[18];
        data_str[16] <= #1 data_str[17];
        data_str[15] <= #1 data_str[16];
        data_str[14] <= #1 data_str[15];
        data_str[13] <= #1 data_str[14];
        data_str[12] <= #1 data_str[13];
        data_str[11] <= #1 data_str[12];
        data_str[10] <= #1 data_str[11]; 
        data_str[9] <= #1 data_str[10];
        data_str[8] <= #1 data_str[9];
        data_str[7] <= #1 data_str[8];           
        data_str[6] <= #1 data_str[7];
        data_str[5] <= #1 data_str[6];
        data_str[4] <= #1 data_str[5];
        data_str[3] <= #1 data_str[4];
        data_str[2] <= #1 data_str[3];
        data_str[1] <= #1 data_str[2];
        data_str[0] <= #1 data_str[1];        
    end
    
    reg r_rx_done;
    always@(posedge Clk)
        r_rx_done <= rx_done;
    
    always@(posedge Clk or negedge Reset_n)
    if(!Reset_n) begin
        address <= #1 0;
        data <= #1 0;
        cmdvalid <= #1 0;
        num_cmd <= #1 0;
    end else if(r_rx_done)begin
        if((data_str[0] == 8'h55) && (data_str[1] == 8'hA5) && (data_str[21] == 8'hF0))begin
            data <= #1 {data_str[5],data_str[6],data_str[7],data_str[8],data_str[9],
                        data_str[10],data_str[11],data_str[12],data_str[13],data_str[14],data_str[15],
                        data_str[16],data_str[17],data_str[18],data_str[19],data_str[20]};
            num_cmd <= #1 data_str[4];
            address <= #1 {data_str[2],data_str[3]};
            cmdvalid <= #1 1;
        end
    end
    else
        cmdvalid <= #1 0;     
    
endmodule
