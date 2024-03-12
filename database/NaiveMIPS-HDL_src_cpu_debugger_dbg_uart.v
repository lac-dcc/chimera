module dbg_uart (/*autoport*/
//output
           host_cmd,
           host_param,
           host_en,
           txd,
//input
           clk,
           clk_uart,
           rst_n,
           host_result,
           rxd);
input wire clk;
input wire clk_uart;
input wire rst_n;
output reg[7:0] host_cmd;
output reg[31:0] host_param;
input wire[31:0] host_result;
output wire host_en;

input wire rxd;
output wire txd;

wire tx_idle;
wire rx_data_available;
wire tx_request;
reg[7:0] tx_data;
reg[7:0] state;
wire[7:0] rx_data;

reg[31:0] host_result_buf;

assign host_en = state==8'd8;
assign tx_request = tx_idle & (state>=8'd10 && state<=8'd13);

always @(posedge clk or negedge rst_n) begin : proc_rxdata_select
    if(~rst_n) begin 
        host_cmd <= 0;
        host_param <= 0;
    end else if(rx_data_available) begin 
        case (state)
        8'd0: host_cmd <= rx_data;
        8'd1: host_param[7:0] <= rx_data;
        8'd2: host_param[15:8] <= rx_data;
        8'd3: host_param[23:16] <= rx_data;
        8'd4: host_param[31:24] <= rx_data;
        default : /* default */;
        endcase
    end
end

always @(*) begin : proc_txdata_select
    case (state)
    8'd10: tx_data <= host_result_buf[7:0];
    8'd11: tx_data <= host_result_buf[15:8];
    8'd12: tx_data <= host_result_buf[23:16];
    8'd13: tx_data <= host_result_buf[31:24];
    default : tx_data <= 8'b0;
    endcase
end

always @(posedge clk or negedge rst_n) begin : proc_uart_debugger
    if(~rst_n) begin
        state <= 0;
    end else begin
        case (state)
        8'd0:    //Receiving 1 byte command
        begin 
            if(rx_data_available) begin 
                if(rx_data[7])
                    state <= 8'd1;
                else
                    state <= 8'd5;
            end
        end
        8'd1,    //4 byte parameters
        8'd2,    
        8'd3,    
        8'd4: begin
            if(rx_data_available)
                state <= state+8'd1;
        end
        8'd5: begin 
            state <= 8'd8;
        end
        8'd8: begin //assert host_en
            state <= state+8'd1;
        end
        8'd9: begin
            $display("Debugger Result=%x",host_result);
            host_result_buf <= host_result;
            state <= state+8'd1;
        end
        8'd10,    //Sending result
        8'd11,    
        8'd12,    
        8'd13: begin 
            if(tx_idle) begin 
                state <= state+8'd1;
            end
        end   
        8'd14: state <= 8'd0;
        default : /* default */;
        endcase
    end
end

uart_tx tx_dbg(/*autoinst*/
            .idle(tx_idle),
            .txd(txd),
            .clk_bus(clk),
            .clk_uart(clk_uart),
            .rst_n(rst_n),
            .tx_request(tx_request),
            .data(tx_data));

uart_rx rx_dbg(/*autoinst*/
            .data(rx_data),
            .data_available(rx_data_available),
            .clk_bus(clk),
            .clk_uart(clk_uart),
            .rst_n(rst_n),
            .clear(rx_data_available),
            .rxd_in(rxd));
endmodule
