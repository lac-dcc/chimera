// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

module eth_phy_10g_tb;
// Señales de Clock y Reset
reg rx_clk;
reg rx_rst;
reg tx_clk;
reg tx_rst;


// Señales para la comunicación entre los módulos
reg [63:0] xgmii_txd;   // Datos de entrada XGMII
reg [7:0] xgmii_txc;    // Señales de control XGMII
wire tx_bad_block;     // Señal de estado para bloques defectuosos
wire [1:0] serdes_tx_hdr; // Cabezal de salida del transmisor
wire [63:0] serdes_tx_data; // Datos de salida del transmisor
reg [1:0] serdes_rx_hdr; // Cabezal de salida del transmisor
reg [63:0] serdes_rx_data; // Datos de salida del transmisor
wire [63:0] xgmii_rxd;  // Datos de salida XGMII
wire [7:0] xgmii_rxc;  // Señales de control de salida XGMII

// Instancia del módulo PHY 10G Ethernet
eth_phy_10g #(
    .DATA_WIDTH(64),
    .CTRL_WIDTH(8),
    .HDR_WIDTH(2)
    
) eth_phy_10g_inst (
    .rx_clk(rx_clk),
    .rx_rst(rx_rst),
    .tx_clk(tx_clk),
    .tx_rst(tx_rst),
    .xgmii_txd(xgmii_txd),
    .xgmii_txc(xgmii_txc),
    .xgmii_rxd(xgmii_rxd),
    .xgmii_rxc(xgmii_rxc),
    .serdes_tx_data(serdes_tx_data),
    .serdes_tx_hdr(serdes_tx_hdr),
    .serdes_rx_data(serdes_rx_data),
    .serdes_rx_hdr(serdes_rx_hdr),
    .serdes_rx_bitslip(),
    .serdes_rx_reset_req(),
    .tx_bad_block(tx_bad_block),
    .rx_error_count(rx_error_count),
    .rx_bad_block(rx_bad_block),
    .rx_sequence_error(rx_sequence_error),
    .rx_block_lock(rx_block_lock),
    .rx_high_ber(rx_high_ber),
    .rx_status(rx_status),
    .cfg_tx_prbs31_enable(1'b0),
    .cfg_rx_prbs31_enable(1'b0)
);

// Inicializa parametros
initial begin
    // Inicialización de las señales
    rx_rst = 1;
    rx_clk = 0;
    tx_rst = 1;
    tx_clk = 0;
    
    // Coloca Reset en 0
    fork
        #10 rx_rst = 0;
        #10 tx_rst = 0;
    join
    
    // Inicialización de los datos XGMII
    xgmii_txd = 64'h0FA58D310FA58D31; // Inicializa todos los bits despues de 10s de reset
    
    // Inicialización de las señales de control XGMII
    xgmii_txc = 8'h00; // Asigna a los bits 00h
end

// Generador de Clock
always 
    #10 rx_clk = ~rx_clk;
always 
    #10 tx_clk = ~tx_clk;

always @(posedge tx_clk) begin
    serdes_rx_data <= serdes_tx_data;
    serdes_rx_hdr <= serdes_tx_hdr;
end

   
endmodule