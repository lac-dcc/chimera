// This program was cloned from: https://github.com/JerryAvila06/PWM_Sinewave
// License: Apache License 2.0

module PWM_Sine_UART(
    input               clk1         , // Top level system clock input.
    input               sw_0        , // Slide switches.
    input               sw_1        , // Slide switches.
    input   wire        uart_rxd    , // UART Recieve pin.
    output  wire        uart_txd    , // UART transmit pin.
    input               rst         , // Reset
    output reg          pwm_out      // Salida PWM Sine
    //output  wire [7:0]  led         ,
   // output  reg         led_out     
    
);

//integer i;
//integer temp;
//reg [7:0] uart_data_buffer [3:0]; // Buffer para almacenar los bytes recibidos
reg [31:0] concatenated_data;     // Número entero formado por la concatenación de los bytes recibidos
reg [31:0] counter = 0; // Contador para generar la frecuencia de PWM
reg [7:0] lut_addr = 0; // Dirección para la tabla de búsqueda (LUT)
reg clk_out = 0;
reg [3:0] count_clk = 0;
// Tabla de búsqueda para la forma de onda sinusoidal
reg [7:0] tabla [0:255]; // LUT de 256 valores
integer freq;
//integer data0;
//integer data1;
//integer data2;
//integer data3;
// Inicialización de la tabla de búsqueda con valores de una onda sinusoidal de amplitud 8-bit
initial begin
tabla[0] = 8'h80;
tabla[1] = 8'h85;
tabla[2] = 8'h8A;
tabla[3] = 8'h8F;
tabla[4] = 8'h95;
tabla[5] = 8'h9A;
tabla[6] = 8'h9F;
tabla[7] = 8'hA4;
tabla[8] = 8'hA9;
tabla[9] = 8'hAE;
tabla[10] = 8'hB3;
tabla[11] = 8'hB8;
tabla[12] = 8'hBD;
tabla[13] = 8'hC2;
tabla[14] = 8'hC6;
tabla[15] = 8'hCA;
tabla[16] = 8'hCF;
tabla[17] = 8'hD3;
tabla[18] = 8'hD7;
tabla[19] = 8'hDB;
tabla[20] = 8'hDE;
tabla[21] = 8'hE2;
tabla[22] = 8'hE5;
tabla[23] = 8'hE8;
tabla[24] = 8'hEB;
tabla[25] = 8'hEE;
tabla[26] = 8'hF0;
tabla[27] = 8'hF3;
tabla[28] = 8'hF5;
tabla[29] = 8'hF7;
tabla[30] = 8'hF9;
tabla[31] = 8'hFA;
tabla[32] = 8'hFC;
tabla[33] = 8'hFD;
tabla[34] = 8'hFE;
tabla[35] = 8'hFE;
tabla[36] = 8'hFF;
tabla[37] = 8'hFF;
tabla[38] = 8'hFF;
tabla[39] = 8'hFF;
tabla[40] = 8'hFE;
tabla[41] = 8'hFE;
tabla[42] = 8'hFD;
tabla[43] = 8'hFC;
tabla[44] = 8'hFA;
tabla[45] = 8'hF9;
tabla[46] = 8'hF7;
tabla[47] = 8'hF5;
tabla[48] = 8'hF3;
tabla[49] = 8'hF0;
tabla[50] = 8'hEE;
tabla[51] = 8'hEB;
tabla[52] = 8'hE8;
tabla[53] = 8'hE5;
tabla[54] = 8'hE2;
tabla[55] = 8'hDE;
tabla[56] = 8'hDB;
tabla[57] = 8'hD7;
tabla[58] = 8'hD3;
tabla[59] = 8'hCF;
tabla[60] = 8'hCA;
tabla[61] = 8'hC6;
tabla[62] = 8'hC2;
tabla[63] = 8'hBD;
tabla[64] = 8'hB8;
tabla[65] = 8'hB3;
tabla[66] = 8'hAE;
tabla[67] = 8'hA9;
tabla[68] = 8'hA4;
tabla[69] = 8'h9F;
tabla[70] = 8'h9A;
tabla[71] = 8'h95;
tabla[72] = 8'h8F;
tabla[73] = 8'h8A;
tabla[74] = 8'h85;
tabla[75] = 8'h80;
tabla[76] = 8'h7A;
tabla[77] = 8'h75;
tabla[78] = 8'h70;
tabla[79] = 8'h6A;
tabla[80] = 8'h65;
tabla[81] = 8'h60;
tabla[82] = 8'h5B;
tabla[83] = 8'h56;
tabla[84] = 8'h51;
tabla[85] = 8'h4C;
tabla[86] = 8'h47;
tabla[87] = 8'h43;
tabla[88] = 8'h3D;
tabla[89] = 8'h39;
tabla[90] = 8'h35;
tabla[91] = 8'h30;
tabla[92] = 8'h2C;
tabla[93] = 8'h28;
tabla[94] = 8'h24;
tabla[95] = 8'h21;
tabla[96] = 8'h1D;
tabla[97] = 8'h1A;
tabla[98] = 8'h17;
tabla[99] = 8'h14;
tabla[100] = 8'h11;
tabla[101] = 8'h0F;
tabla[102] = 8'h0C;
tabla[103] = 8'h0A;
tabla[104] = 8'h08;
tabla[105] = 8'h06;
tabla[106] = 8'h05;
tabla[107] = 8'h03;
tabla[108] = 8'h02;
tabla[109] = 8'h01;
tabla[110] = 8'h01;
tabla[111] = 8'h00;
tabla[112] = 8'h00;
tabla[113] = 8'h00;
tabla[114] = 8'h00;
tabla[115] = 8'h01;
tabla[116] = 8'h01;
tabla[117] = 8'h02;
tabla[118] = 8'h03;
tabla[119] = 8'h05;
tabla[120] = 8'h06;
tabla[121] = 8'h08;
tabla[122] = 8'h0A;
tabla[123] = 8'h0C;
tabla[124] = 8'h0F;
tabla[125] = 8'h11;
tabla[126] = 8'h14;
tabla[127] = 8'h17;
tabla[128] = 8'h1A;
tabla[129] = 8'h1D;
tabla[130] = 8'h21;
tabla[131] = 8'h24;
tabla[132] = 8'h28;
tabla[133] = 8'h2C;
tabla[134] = 8'h30;
tabla[135] = 8'h35;
tabla[136] = 8'h39;
tabla[137] = 8'h3D;
tabla[138] = 8'h43;
tabla[139] = 8'h47;
tabla[140] = 8'h4C;
tabla[141] = 8'h51;
tabla[142] = 8'h56;
tabla[143] = 8'h5B;
tabla[144] = 8'h60;
tabla[145] = 8'h65;
tabla[146] = 8'h6A;
tabla[147] = 8'h70;
tabla[148] = 8'h75;
tabla[149] = 8'h7A;
end

// Clock frequency in hertz.
parameter CLK_HZ = 25000000;
parameter BIT_RATE =   9600;
parameter PAYLOAD_BITS = 8;

wire [PAYLOAD_BITS-1:0]  uart_rx_data;
wire        uart_rx_valid;
wire        uart_rx_break;

wire        uart_tx_busy;
wire [PAYLOAD_BITS-1:0]  uart_tx_data;
wire        uart_tx_en;

reg [7:0] uart_data_shift_reg = 0; // Registro de desplazamiento para los datos UART
reg [7:0] uart_data_string[3:0]; // Almacena los bytes recibidos como cadena (4 bytes en este caso)
reg [3:0] byte_counter = 0; // Contador de bytes recibidos

reg  [PAYLOAD_BITS-1:0]  led_reg;
//assign      led = led_reg;

assign uart_tx_data = uart_rx_data;
assign uart_tx_en   = uart_rx_valid;

always @(posedge clk1) begin
    //if(!sw_0) begin
      //  led_reg <= 8'hF0;
    if (rst) begin
        counter <= 0;
        pwm_out <= 0;
        //data0 <= 0;
        //data1 <= 0;
        //data2 <= 0;
        //data3 <= 0;
        if(uart_rx_valid) begin
            led_reg <= uart_rx_data[7:0];
            /*uart_data_buffer[0] <= uart_rx_data;
            uart_data_buffer[1] <= uart_data_buffer[0];
            uart_data_buffer[2] <= uart_data_buffer[1];
            uart_data_buffer[3] <= uart_data_buffer[2];
             
            //for (i = 0; i < 4; i = i + 1) begin
            if ((uart_data_buffer[0] >= 48) && (uart_data_buffer[0] <= 57)) begin
                data0 = (uart_data_buffer[0] - 48) * 1000; // Convertir el carácter ASCII a su valor numérico
            end
            if ((uart_data_buffer[1] >= 48) && (uart_data_buffer[1] <= 57)) begin
                data1 = (uart_data_buffer[1] - 48) * 100; // Convertir el carácter ASCII a su valor numérico
            end
            if ((uart_data_buffer[2] >= 48) && (uart_data_buffer[2] <= 57)) begin
                data2 = (uart_data_buffer[2] - 48) * 10; // Convertir el carácter ASCII a su valor numérico
            end
            if ((uart_data_buffer[3] >= 48) && (uart_data_buffer[3] <= 57)) begin
                data3 = (uart_data_buffer[3] - 48) * 1; // Convertir el carácter ASCII a su valor numérico
            end
           // end
            concatenated_data <= data0 + data1 + data2 + data3;
           */ 
        end
        /*    
        if (concatenated_data >= 1495 && concatenated_data <= 1505) begin
                // Si el número entero es igual a 1234, hacer algo...
                led_out <= 1;
        end
        if (concatenated_data >= 995 && concatenated_data <= 1005) begin
                // Si el número entero es igual a 1234, hacer algo...
                led_out <= 0;
        end*/
        if(uart_rx_data[7:0] == 8'b00110001) begin
            freq<=1600;  
        end
        if(uart_rx_data[7:0] == 8'b00110010) begin
            freq<=825;
            //led_out <= 0;
        end
        if(uart_rx_data[7:0] == 8'b00110011) begin
            freq<=556;
        end
        if(uart_rx_data[7:0] == 8'b00110100) begin
            freq<=415;
        end
        if(uart_rx_data[7:0] == 8'b00110101) begin
            freq<=333;
        end
        if(uart_rx_data[7:0] == 8'b00110110) begin
            freq<=276;
        end
        if(uart_rx_data[7:0] == 8'b00110111) begin
            freq<=237;
        end
    end  
    else begin
        /*if(uart_rx_data[7:0] == 8'b00110001) begin
            freq<=500;
            led_out <= 1;
        end
        if(uart_rx_data[7:0] == 8'b00110010) begin
            freq<=1000;
            led_out <= 0;
        end
        if(uart_rx_data[7:0] == 8'b00110011) begin
            freq<=750;
        end
        if(uart_rx_data[7:0] == 8'b00110100) begin
            freq<=1500;
        end
        if(uart_rx_data[7:0] == 8'b00110101) begin
            freq<=300;
        end*/
    //count_clk = count_clk + 1;
      //  if (count_clk>=3) begin
        //    clk_out <= ~clk_out;
          //  count_clk <= 0;
            counter <= counter + 1;
            if (counter >= freq) begin // 100 MHz / 500 Hz
                counter <= 0;
                lut_addr <= lut_addr + 1;
                if (lut_addr == 149) begin
                    lut_addr <= 0;
                end
            end
            if (tabla[lut_addr] > counter)
                pwm_out <= 1;
            else
                pwm_out <= 0;
            //end      
        
            /*case(uart_rx_data[7:0])
                8'b00110001: freq = 250; // Si numero es 1
                8'b00110010: freq = 300; // Si numero es 2
                8'b00110011: freq = 350; // Si numero es 3
                8'b00110100: freq = 400; // Si numero es 4
                8'b00110101: freq = 450; // Si numero es 5
                default: freq = freq; // Para cualquier otro valor
            endcase*/
       // end
    end
    
end

// UART RX
uart_rx #(
.BIT_RATE(BIT_RATE),
.PAYLOAD_BITS(PAYLOAD_BITS),
.CLK_HZ  (CLK_HZ  )
) i_uart_rx(
.clk          (clk1          ), // Top level system clock input.
.resetn       (sw_0         ), // Asynchronous active low reset.
.uart_rxd     (uart_rxd     ), // UART Recieve pin.
.uart_rx_en   (1'b1         ), // Recieve enable
.uart_rx_break(uart_rx_break), // Did we get a BREAK message?
.uart_rx_valid(uart_rx_valid), // Valid data recieved and available.
.uart_rx_data (uart_rx_data )  // The recieved data.
);

// UART Transmitter module.
uart_tx #(
.BIT_RATE(BIT_RATE),
.PAYLOAD_BITS(PAYLOAD_BITS),
.CLK_HZ  (CLK_HZ  )
) i_uart_tx(
.clk          (clk1          ),
.resetn       (sw_0         ),
.uart_txd     (uart_txd     ),
.uart_tx_en   (uart_tx_en   ),
.uart_tx_busy (uart_tx_busy ),
.uart_tx_data (uart_tx_data ) 
);

endmodule
