// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

module ans_proc (
    input   wire            i_clk,
    input   wire            i_rst_n,
    input   wire    [29:0]  i_ph1,
    input   wire    [29:0]  i_ph2,
    input   wire    [29:0]  i_ph3,
    input   wire    [29:0]  i_ph4,
    input   wire    [29:0]  i_ph5,
    input   wire    [27:0]  i_freq,
    input   wire            i_tx_start,
    output  wire            o_uart_tx
    );


    // Data Sampling
    reg     [29:0]  r_ph1;
    reg     [29:0]  r_ph2;
    reg     [29:0]  r_ph3;
    reg     [29:0]  r_ph4;
    reg     [29:0]  r_ph5;
    reg     [27:0]  r_freq;
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_ph1[29:0] <= 30'd0;
            r_ph2[29:0] <= 30'd0;
            r_ph3[29:0] <= 30'd0;
            r_ph4[29:0] <= 30'd0;
            r_ph5[29:0] <= 30'd0;
            r_freq[27:0] <= 28'd0;
        end else if (i_tx_start) begin
            r_ph1[29:0] <= i_ph1[29:0];
            r_ph2[29:0] <= i_ph2[29:0];
            r_ph3[29:0] <= i_ph3[29:0];
            r_ph4[29:0] <= i_ph4[29:0];
            r_ph5[29:0] <= i_ph5[29:0];
            r_freq[27:0] <= i_freq[27:0];
        end
    end

    // Byte Counter
    reg     [7:0]   r_write_byte_cnt;
    reg             r_uart_tx_busy;
    reg             r_uart_tx_en;
    wire            w_tx_empty;
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_write_byte_cnt[7:0] <= 8'd0;
            r_uart_tx_busy <= 1'b0;
            r_uart_tx_en <= 1'b0;
        end else if (i_tx_start) begin                  // Start
            r_uart_tx_busy <= 1'b1;
        end else if (r_uart_tx_busy & w_tx_empty) begin
            r_uart_tx_en <= 1'b1;
        end else if (r_uart_tx_en) begin
            r_write_byte_cnt[7:0] <= r_write_byte_cnt[7:0] + 8'd1;
            r_uart_tx_en <= 1'b0;

            if (r_write_byte_cnt[7:0] == 8'd53) begin   // End
                r_write_byte_cnt[7:0] <= 8'd0;
                r_uart_tx_busy <= 1'b0;
            end

        end
    end

    // Get Hex String
    function [7:0] getHexStr (input [3:0] in);
        begin
            case (in[3:0])
                4'h0: getHexStr[7:0] = 8'h30;
                4'h1: getHexStr[7:0] = 8'h31;
                4'h2: getHexStr[7:0] = 8'h32;
                4'h3: getHexStr[7:0] = 8'h33;
                4'h4: getHexStr[7:0] = 8'h34;
                4'h5: getHexStr[7:0] = 8'h35;
                4'h6: getHexStr[7:0] = 8'h36;
                4'h7: getHexStr[7:0] = 8'h37;
                4'h8: getHexStr[7:0] = 8'h38;
                4'h9: getHexStr[7:0] = 8'h39;
                4'hA: getHexStr[7:0] = 8'h41;
                4'hB: getHexStr[7:0] = 8'h42;
                4'hC: getHexStr[7:0] = 8'h43;
                4'hD: getHexStr[7:0] = 8'h44;
                4'hE: getHexStr[7:0] = 8'h45;
                4'hF: getHexStr[7:0] = 8'h46;
            endcase
        end
    endfunction

    /* tx Data Select */
    wire    [7:0]   w_uart_tx_data = 
                                     (r_write_byte_cnt[7:0] == 8'd0) ? getHexStr({2'd0, r_ph1[29:28]}) :
                                     (r_write_byte_cnt[7:0] == 8'd1) ? getHexStr(r_ph1[27:24]) :
                                     (r_write_byte_cnt[7:0] == 8'd2) ? getHexStr(r_ph1[23:20]) :
                                     (r_write_byte_cnt[7:0] == 8'd3) ? getHexStr(r_ph1[19:16]) :
                                     (r_write_byte_cnt[7:0] == 8'd4) ? getHexStr(r_ph1[15:12]) :
                                     (r_write_byte_cnt[7:0] == 8'd5) ? getHexStr(r_ph1[11:8]) :
                                     (r_write_byte_cnt[7:0] == 8'd6) ? getHexStr(r_ph1[7:4]) :
                                     (r_write_byte_cnt[7:0] == 8'd7) ? getHexStr(r_ph1[3:0]) :
                                     (r_write_byte_cnt[7:0] == 8'd8) ? 8'h2c :   // ,

                                     (r_write_byte_cnt[7:0] == 8'd9) ? getHexStr({2'd0, r_ph2[29:28]}) :
                                     (r_write_byte_cnt[7:0] == 8'd10) ? getHexStr(r_ph2[27:24]) :
                                     (r_write_byte_cnt[7:0] == 8'd11) ? getHexStr(r_ph2[23:20]) :
                                     (r_write_byte_cnt[7:0] == 8'd12) ? getHexStr(r_ph2[19:16]) :
                                     (r_write_byte_cnt[7:0] == 8'd13) ? getHexStr(r_ph2[15:12]) :
                                     (r_write_byte_cnt[7:0] == 8'd14) ? getHexStr(r_ph2[11:8]) :
                                     (r_write_byte_cnt[7:0] == 8'd15) ? getHexStr(r_ph2[7:4]) :
                                     (r_write_byte_cnt[7:0] == 8'd16) ? getHexStr(r_ph2[3:0]) :
                                     (r_write_byte_cnt[7:0] == 8'd17) ? 8'h2c :   // ,

                                     (r_write_byte_cnt[7:0] == 8'd18) ? getHexStr({2'd0, r_ph3[29:28]}) :
                                     (r_write_byte_cnt[7:0] == 8'd19) ? getHexStr(r_ph3[27:24]) :
                                     (r_write_byte_cnt[7:0] == 8'd20) ? getHexStr(r_ph3[23:20]) :
                                     (r_write_byte_cnt[7:0] == 8'd21) ? getHexStr(r_ph3[19:16]) :
                                     (r_write_byte_cnt[7:0] == 8'd22) ? getHexStr(r_ph3[15:12]) :
                                     (r_write_byte_cnt[7:0] == 8'd23) ? getHexStr(r_ph3[11:8]) :
                                     (r_write_byte_cnt[7:0] == 8'd24) ? getHexStr(r_ph3[7:4]) :
                                     (r_write_byte_cnt[7:0] == 8'd25) ? getHexStr(r_ph3[3:0]) :
                                     (r_write_byte_cnt[7:0] == 8'd26) ? 8'h2c :   // ,
                                     
                                     (r_write_byte_cnt[7:0] == 8'd27) ? getHexStr({2'd0, r_ph4[29:28]}) :
                                     (r_write_byte_cnt[7:0] == 8'd28) ? getHexStr(r_ph4[27:24]) :
                                     (r_write_byte_cnt[7:0] == 8'd29) ? getHexStr(r_ph4[23:20]) :
                                     (r_write_byte_cnt[7:0] == 8'd30) ? getHexStr(r_ph4[19:16]) :
                                     (r_write_byte_cnt[7:0] == 8'd31) ? getHexStr(r_ph4[15:12]) :
                                     (r_write_byte_cnt[7:0] == 8'd32) ? getHexStr(r_ph4[11:8]) :
                                     (r_write_byte_cnt[7:0] == 8'd33) ? getHexStr(r_ph4[7:4]) :
                                     (r_write_byte_cnt[7:0] == 8'd34) ? getHexStr(r_ph4[3:0]) :
                                     (r_write_byte_cnt[7:0] == 8'd35) ? 8'h2c :   // ,

                                     (r_write_byte_cnt[7:0] == 8'd36) ? getHexStr({2'd0, r_ph5[29:28]}) :
                                     (r_write_byte_cnt[7:0] == 8'd37) ? getHexStr(r_ph5[27:24]) :
                                     (r_write_byte_cnt[7:0] == 8'd38) ? getHexStr(r_ph5[23:20]) :
                                     (r_write_byte_cnt[7:0] == 8'd39) ? getHexStr(r_ph5[19:16]) :
                                     (r_write_byte_cnt[7:0] == 8'd40) ? getHexStr(r_ph5[15:12]) :
                                     (r_write_byte_cnt[7:0] == 8'd41) ? getHexStr(r_ph5[11:8]) :
                                     (r_write_byte_cnt[7:0] == 8'd42) ? getHexStr(r_ph5[7:4]) :
                                     (r_write_byte_cnt[7:0] == 8'd43) ? getHexStr(r_ph5[3:0]) :
                                     (r_write_byte_cnt[7:0] == 8'd44) ? 8'h2c :   // ,

                                     (r_write_byte_cnt[7:0] == 8'd45) ? getHexStr(r_freq[27:24]) :
                                     (r_write_byte_cnt[7:0] == 8'd46) ? getHexStr(r_freq[23:20]) :
                                     (r_write_byte_cnt[7:0] == 8'd47) ? getHexStr(r_freq[19:16]) :
                                     (r_write_byte_cnt[7:0] == 8'd48) ? getHexStr(r_freq[15:12]) :
                                     (r_write_byte_cnt[7:0] == 8'd49) ? getHexStr(r_freq[11:8]) :
                                     (r_write_byte_cnt[7:0] == 8'd50) ? getHexStr(r_freq[7:4]) :
                                     (r_write_byte_cnt[7:0] == 8'd51) ? getHexStr(r_freq[3:0]) :

                                     (r_write_byte_cnt[7:0] == 8'd52) ? 8'h0d :    // CR "\r"
                                     (r_write_byte_cnt[7:0] == 8'd53) ? 8'h0a :    // LF "\n"
                                     8'd0;



    uart_tx uart_tx_inst (
        .i_clk ( i_clk ),
        .i_rst_n ( i_rst_n ),
        .i_data ( w_uart_tx_data[7:0] ),
        .i_txen ( r_uart_tx_en ),
        .o_uart_miso ( o_uart_tx ),
        .o_txempty ( w_tx_empty )
    );

endmodule
