// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 02:19:04 PM
// Design Name: 
// Module Name: fsm_adas
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


module fsm_adas
(
input clk,
input rst_n,
input timer_tick_i,                 // her 1 ms'de 1 kez '1' olur
input mod_i,                        // 1'b0 -> assistance 1'b1 otonom
input [1:0] kirmizi_isik_i,         // (1) lidar, (0) kamera
input [1:0] yaya_gecidi_i,          // (1) lidar, (0) kamera
input [7:0] mesafe_olcum_lidar_i,   // lidar ondeki arac olcumu (metre)
input [7:0] mesafe_olcum_kamera_i,  // kamera ondeki arac olcumu (metre)
input [7:0] mesafe_giris_i,         // otonom mod icin arac takip mesafe girdisi
input [7:0] hiz_olcum_i,            // aracin hızı olcum (km/s)
input [7:0] hiz_giris_i,            // otonom mod icin arac hiz girdisi
output gaz_o,                       // otonom mod icin gaza bas
output fren_o,                      // otonom mod icin frene bas
output kirmizi_isik_o,              // assistance mod icin uyari
output yaya_gecidi_o,               // assistance mod icin uyari
output takip_mesafe_o               // assistance mod icin uyari
);

// Gray encoding for FSM regs
localparam ASSISTANCE   = 2'b00;
localparam TRANSITION   = 2'b01;
localparam OTONOM       = 2'b11;

localparam ON   = 1'b1;
localparam OFF  = 1'b0;

integer i;

// registers
reg [7:0] olcum_buffer [0:2];
reg [1:0] state;
reg [7:0] takip_mesafe_kaydedilen;
reg [7:0] hiz_kaydedilen;

// comb signals
reg kirmizi_isik_var;
reg yaya_gecidi_var;
reg [7:0] mesafe_fark;
reg [8:0] yeni_mesafe_olcum;    // saga kaydirma nedeniyle 1 bit fazla
reg [9:0] olcum_ortalama;       // saga kaydirma nedeniyle 2 bit fazla

// for output signals
reg gaz, fren, kirmizi_isik, yaya_gecidi, takip_mesafe;

always @(*) begin
    
    kirmizi_isik_var = 1'b0;
    if (kirmizi_isik_i == 2'b11) begin
        kirmizi_isik_var = 1'b1;
    end

    yaya_gecidi_var = 1'b0;
    if (yaya_gecidi_i == 2'b11) begin
        yaya_gecidi_var = 1'b1;
    end

    if (mesafe_olcum_lidar_i >= mesafe_olcum_kamera_i) begin
        mesafe_fark = mesafe_olcum_lidar_i - mesafe_olcum_kamera_i;
    end
    else begin
        mesafe_fark = mesafe_olcum_kamera_i - mesafe_olcum_lidar_i;
    end

    if (mesafe_fark < 20) begin
        yeni_mesafe_olcum = (mesafe_olcum_lidar_i + mesafe_olcum_kamera_i) >> 1;
    end
    else begin
        yeni_mesafe_olcum = mesafe_olcum_lidar_i;
    end
    
    olcum_ortalama = (olcum_buffer[2] + olcum_buffer[1] + olcum_buffer[0] + yeni_mesafe_olcum) >> 2;

end

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        state                   <= ASSISTANCE;
        gaz                     <= 1'b0;     
        fren                    <= 1'b0;        
        kirmizi_isik            <= 1'b0;
        yaya_gecidi             <= 1'b0;
        takip_mesafe            <= 1'b0;
        takip_mesafe_kaydedilen <= 50;
        hiz_kaydedilen          <= 100;
        for (i = 0; i < 3 ; i=i+1) begin
            olcum_buffer[i]     <= {8{1'b0}};
        end
    end
    else begin

        olcum_buffer[2] <= olcum_buffer[1];
        olcum_buffer[1] <= olcum_buffer[0];
        olcum_buffer[0] <= olcum_ortalama;

        case (state)

            ASSISTANCE : begin
                if (timer_tick_i == 1'b1) begin
                    
                    if (kirmizi_isik_var == 1'b1) begin
                        kirmizi_isik    <= ON;
                    end
                    else begin
                        kirmizi_isik    <= OFF;
                    end

                    if (yaya_gecidi_var == 1'b1) begin
                        yaya_gecidi     <= ON;
                    end
                    else begin
                        yaya_gecidi     <= OFF;
                    end

                    if (olcum_ortalama < takip_mesafe_kaydedilen) begin
                        takip_mesafe    <= ON;
                    end
                    else begin
                        takip_mesafe    <= OFF;
                    end

                    if (mod_i == 1'b1) begin
                        kirmizi_isik    <= OFF;
                        yaya_gecidi     <= OFF;
                        takip_mesafe    <= OFF;
                        state           <= TRANSITION;                        
                    end

                end
            end 

            TRANSITION : begin
                if (timer_tick_i == 1'b1) begin
                    takip_mesafe_kaydedilen <= mesafe_giris_i;
                    hiz_kaydedilen          <= hiz_giris_i;
                    state                   <= OTONOM;
                end
            end

            OTONOM : begin
                if (timer_tick_i == 1'b1) begin

                    if (mod_i == 1'b0) begin
                        fren    <= OFF;
                        gaz     <= OFF;
                        state   <= ASSISTANCE;
                    end
                    else begin

                        if (olcum_ortalama < takip_mesafe_kaydedilen) begin
                            fren    <= ON;
                            gaz     <= OFF;                            
                        end
                        else begin
                            if (hiz_olcum_i < hiz_kaydedilen) begin
                                fren    <= OFF;
                                gaz     <= ON;
                            end
                            else if (hiz_olcum_i == hiz_kaydedilen) begin
                                fren    <= OFF;
                                gaz     <= OFF;                                
                            end
                            else begin
                                fren    <= ON;
                                gaz     <= OFF;                               
                            end
                        end

                        if (yaya_gecidi_var == 1'b1) begin
                            if (hiz_olcum_i > 20) begin
                                fren    <= ON;
                                gaz     <= OFF;                                
                            end
                            else begin
                                fren    <= OFF;
                                gaz     <= OFF;                                 
                            end
                        end                        

                        if (kirmizi_isik_var == 1'b1) begin
                            fren    <= ON;
                            gaz     <= OFF;
                        end

                    end

                end
            end

            default: begin
                state <= ASSISTANCE;
            end

        endcase        
    end
end

// output signal assignments
assign gaz_o            = gaz;         
assign fren_o           = fren;        
assign kirmizi_isik_o   = kirmizi_isik;
assign yaya_gecidi_o    = yaya_gecidi; 
assign takip_mesafe_o   = takip_mesafe; 

endmodule