`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 08:31:43 PM
// Design Name: 
// Module Name: fsm_otopilot
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fsm_otopilot
(
input clk,
input rst_n,
input [15:0] gnss_i,
input [15:0] altimetre_i,
input [7:0] hedef_yukseklik_i,
input yukseklik_bilgisi_i,
output motor_o,
output yesil_led_o,
output kirmizi_led_o
);

localparam S_YUKSEKLIK_BEKLE    = 2'b00;
localparam S_ACIL_DURUS         = 2'b01;
localparam S_UCUS               = 2'b10;

// combinational assignments
reg hedef_yukseklik_hata;
reg motor_ac;
reg [15:0] sensor_fark;
reg [15:0] sensor_ortalama;

// registers
reg [1:0] state;
reg [1:0] hata_sayaci;
reg [7:0] atanan_yukseklik;
reg yesil_led;
reg kirmizi_led;
reg motor;


always @(*) begin
    if (hedef_yukseklik_i < 10 || hedef_yukseklik_i > 100) begin
        hedef_yukseklik_hata = 1'b1;
    end
    else begin
        hedef_yukseklik_hata = 1'b0;
    end

    if (gnss_i > altimetre_i) begin
        sensor_fark = gnss_i - altimetre_i;    
    end
    else begin
        sensor_fark = altimetre_i - gnss_i;
    end

    if (sensor_fark > 9) begin
        sensor_ortalama     = gnss_i;
    end
    else begin
        sensor_ortalama     = (gnss_i + altimetre_i) >> 1;        
    end
    
    motor_ac = 0;
    if (state == S_UCUS) begin
        if (sensor_ortalama >= atanan_yukseklik) begin
            motor_ac = 1'b0;
        end
        else begin
            motor_ac = 1'b1;
        end
    end

end

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        state               <= S_YUKSEKLIK_BEKLE;
        hata_sayaci         <= 2'b00;
        atanan_yukseklik    <= 8'b00000000;
        yesil_led           <= 1'b0;
        kirmizi_led         <= 1'b0;
        motor               <= 1'b0;
    end
    else begin
        case (state)
            S_YUKSEKLIK_BEKLE : begin
                if (yukseklik_bilgisi_i == 1'b1) begin
                    if (hedef_yukseklik_hata == 1'b0) begin
                        atanan_yukseklik    <= hedef_yukseklik_i;
                        state               <= S_UCUS;
                    end
                    else begin
                        if (hata_sayaci == 2'b10) begin
                            state       <= S_ACIL_DURUS;
                            kirmizi_led <= 1'b1;
                        end
                        else begin
                            hata_sayaci <= hata_sayaci + 2'b01;
                            state       <= S_YUKSEKLIK_BEKLE;
                        end
                    end
                end
                else begin
                    state <= S_YUKSEKLIK_BEKLE;
                end
            end
            S_ACIL_DURUS : begin
                //
            end
            S_UCUS : begin
                if (motor_ac == 1'b1) begin
                   motor        <= 1'b1; 
                end
                else begin
                    motor       <= 1'b0;
                    yesil_led   <= 1'b1;
                end
            end

            default: begin
                state <= S_YUKSEKLIK_BEKLE;
            end
        endcase
    end
end

assign motor_o          = motor;
assign yesil_led_o      = yesil_led;
assign kirmizi_led_o    = kirmizi_led;

endmodule