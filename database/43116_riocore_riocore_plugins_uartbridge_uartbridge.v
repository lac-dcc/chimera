// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module uartbridge 
    #(parameter RX_BUFFERSIZE=64, parameter TX_BUFFERSIZE=64, parameter ClkFrequency=12000000, parameter Baud=9600)
    (
        input clk,
        input rx,
        output tx,
        output wire tx_enable,
        output reg [RX_BUFFERSIZE-1:0] rxdata,
        input [TX_BUFFERSIZE-1:0] txdata
    );

    reg [31:0] counter = 0;
    reg [7:0] value_n = 0;

    reg [7:0] txlen = 0;
    reg [TX_BUFFERSIZE-17:0] txbuffer = 0;

    reg [7:0] tx_frame_id_ack = 0;
    reg [7:0] tx_frame_id_last = 0;
    wire [7:0] tx_frame_id;
    assign tx_frame_id = txdata[7:0];

    wire [7:0] tx_frame_len;
    assign tx_frame_len = txdata[15:8];

    reg [7:0] rxlen = 0;
    reg [RX_BUFFERSIZE-25:0] rxbuffer = 0;
    reg [7:0] rx_frame_id = 0;
    reg [7:0] rx_frame_len = 0;

    wire [7:0] RxD_data;
    wire RxD_data_ready;
    wire RxD_idle;
    wire RxD_endofpacket;

    uart_rx #(ClkFrequency, Baud) uart_rx1 (
        .clk (clk),
        .RxD (rx),
        .RxD_data_ready (RxD_data_ready),
        .RxD_data (RxD_data),
        .RxD_idle (RxD_idle),
        .RxD_endofpacket (RxD_endofpacket)
    );

    always @(posedge clk) begin
        //rxdata[7:0] <= tx_frame_id_ack;

        if (RxD_endofpacket == 1) begin
            rxdata <= {rxbuffer[RX_BUFFERSIZE-25:0], rxlen, rx_frame_id, tx_frame_id_ack};
            rxbuffer <= 0;

            rx_frame_id <= rx_frame_id + 1;
            rxlen <= 0;

        end else if (RxD_data_ready == 1) begin
            if (rxlen < (RX_BUFFERSIZE / 8) - 3) begin
                rxbuffer <= {rxbuffer[RX_BUFFERSIZE-25-8:0], RxD_data};
                //rxbuffer <= {RxD_data, rxbuffer[RX_BUFFERSIZE-17:8]};
                rxlen <= rxlen + 1;
            end
        end

    end

    reg TxD_start = 0;
    wire TxD_busy;
    reg [7:0] TxD_data = 0;

    uart_tx #(ClkFrequency, Baud) uart_tx1 (
        .clk (clk),
        .TxD (tx),
        .TxD_data (TxD_data),
        .TxD_start (TxD_start),
        .TxD_busy (TxD_busy)
    );

    reg tx_state = 0;
    assign tx_enable = tx_state;
    reg [7:0] tx_counter = 0;

    always @(posedge clk) begin

        if (tx_frame_id != tx_frame_id_last) begin
            tx_frame_id_last <= tx_frame_id;
            txlen <= tx_frame_len + 1;
            txbuffer <= txdata[TX_BUFFERSIZE-17:16];
            tx_state <= 1;
        end

        if (tx_state == 1) begin
            if (TxD_busy == 0 && TxD_start == 0) begin

                if (txlen > 1) begin
                    tx_counter <= tx_counter + 1;
                    TxD_data <= txbuffer[7:0];
                    
                    txbuffer <= {8'd0, txbuffer[TX_BUFFERSIZE-17:8]};
                    txlen <= txlen - 1;


                    TxD_start <= 1;
                end else begin
                    tx_counter <= 0;
                    tx_state <= 0;
                    tx_frame_id_ack <= tx_frame_id;
                end
            end else begin
                TxD_start <= 0;

            end
        end else begin
        
            if (counter < ClkFrequency / 100) begin
                counter <= counter + 1;
            end else begin
                //tx_state <= 1;
                counter <= 0;
                value_n <= value_n + 1;
                
            end
        end
    end


endmodule

