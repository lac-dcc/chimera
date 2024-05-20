// This program was cloned from: https://github.com/sofiavalos/Verilog_Ethernet_10g_PCS
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * 10G Ethernet PHY frame sync
 */
module eth_phy_10g_rx_frame_sync #		// se ajustan los bits (slip) de la señal para corregir errores de sincronizacion o desalineaciones
(
    parameter HDR_WIDTH = 2,			// ancho de encabezado
    parameter BITSLIP_HIGH_CYCLES = 1,		// 1 ciclo de reloj para realizar un desplazamiento cuando se detecta una desalineacion alta
    parameter BITSLIP_LOW_CYCLES = 8		// 8 ciclos de reloj para realizar un desplazamiento cuando se detecta una desalineación baja
)
(
    input  wire                  clk,		// entrada de reloj
    input  wire                  rst,		// señal de reinicio

    /*
     * SERDES interface
     */
    input  wire [HDR_WIDTH-1:0]  serdes_rx_hdr,		// entrada que transporta el encabezado de la frame recibida
    output wire                  serdes_rx_bitslip,	// señal de de desplazamiento de bits de salida

    /*
     * Status
     */
    output wire                  rx_block_lock		// señal de salida que inidica si el módulo ha detectado y bloqueado la recepción de un bloque de datos válido
);

parameter BITSLIP_MAX_CYCLES = BITSLIP_HIGH_CYCLES > BITSLIP_LOW_CYCLES ? BITSLIP_HIGH_CYCLES : BITSLIP_LOW_CYCLES;	// determina el límite máximo de ciclos para el desplazamiento de bits tomando el máximo entre high y low
parameter BITSLIP_COUNT_WIDTH = $clog2(BITSLIP_MAX_CYCLES);								// determina la cantidad de bits necesarios para representar el número de ciclos máximos de desplazamiento

// bus width assertions
initial begin
    if (HDR_WIDTH != 2) begin
        $error("Error: HDR_WIDTH must be 2");
        $finish;
    end
end

localparam [1:0]
    SYNC_DATA = 2'b10,		// header de sincronizacion para datos
    SYNC_CTRL = 2'b01;		// header de sincronizacion para control

reg [5:0] sh_count_reg = 6'd0, sh_count_next;					// registro que almacena el conteo de encabezados. Se inicializa en 0 (6 bits). sh_count_next se usa para calcular el próximo valor de sh_count_reg
reg [3:0] sh_invalid_count_reg = 4'd0, sh_invalid_count_next;			// registro que almacena el conteo de encabezados inválidos recibidos. Se inicaliza en 0 (4 bits). sh_invalid_count_next se usa para calcular el próximo valor de sh_invalid_count_reg
reg [BITSLIP_COUNT_WIDTH-1:0] bitslip_count_reg = 0, bitslip_count_next;	// registro que almacena el conteo para controlar el bitslip en la recepción de datos. Se inicializa en 0. bitslip_count_next se usa para calcular el próximo valor de bitslip_count_reg

reg serdes_rx_bitslip_reg = 1'b0, serdes_rx_bitslip_next;			// indica si se está aplicando bitslip en la recepción de datos. Se inicializa en 0

reg rx_block_lock_reg = 1'b0, rx_block_lock_next;				// indica si se ha bloqueado la recepción de un bloque válido de datos. Se inicializa en 0

assign serdes_rx_bitslip = serdes_rx_bitslip_reg;				// asigna las señales de salida a sus respectivos registros para que estas señales sean accesibles externamente al modulo
assign rx_block_lock = rx_block_lock_reg;

always @* begin
    sh_count_next = sh_count_reg;			// los registros next se inicializan con el valor actual de su correspondiente registro
    sh_invalid_count_next = sh_invalid_count_reg;
    bitslip_count_next = bitslip_count_reg;

    serdes_rx_bitslip_next = serdes_rx_bitslip_reg;

    rx_block_lock_next = rx_block_lock_reg;

    if (bitslip_count_reg) begin							// si bitslip_count_reg>0 (ya inició la sincronizacion)
        bitslip_count_next = bitslip_count_reg-1;					// se decrementa en 1 la cuenta de bitslip
    end else if (serdes_rx_bitslip_reg) begin						// si bitslip_count_reg=0 (ya terminó la sincronización o aun no comienza) y serdes_rx_bitslip_reg>0 (si se estaba aplicando el bitslip)
        serdes_rx_bitslip_next = 1'b0;							// se pone en cero para indicar que terminó la corrección de alineación de bits
        bitslip_count_next = BITSLIP_LOW_CYCLES > 0 ? BITSLIP_LOW_CYCLES-1 : 0;		// bitslip_count_next toma el valor de BITSLIP_LOW_CYCLES-1 (si es distinto a cero) para indicar cuantos ciclos de bitslip bajo se pueden realizar antes de que sea necesario realizar una correccion de desalineacion
    end else if (serdes_rx_hdr == SYNC_CTRL || serdes_rx_hdr == SYNC_DATA) begin	// si bitslip_count_reg=0 (ya terminó la sincronización o aun no comienza) y serdes_rx_bitslip_reg=0 (no se estaba aplicando el bitslip), se verifican que los encabezados sean validos
        // valid header
        sh_count_next = sh_count_reg + 1;		// se incrementa en uno el contador de bloques
        if (&sh_count_reg) begin			// si todos los bits de sh_count_reg son 1 se produce un overflow
            // valid count overflow, reset
            sh_count_next = 0;				// se reinicia el contador de bloques
            sh_invalid_count_next = 0;			// se reinicia el contador de encabezados invalidos
            if (!sh_invalid_count_reg) begin		// si no hay encabezados invalidos
                rx_block_lock_next = 1'b1;		// se pone en 1 el indicador que se ha detectado un bloque valido y que se ha mantenido la sincronizacion del bloque
            end
        end
    end else begin							// si el encabezado no es valido
        // invalid header
        sh_count_next = sh_count_reg + 1;				// incrementa el contador de bloques
        sh_invalid_count_next = sh_invalid_count_reg + 1;		// incrementa el contador de encabezados invalidos
        if (!rx_block_lock_reg || &sh_invalid_count_reg) begin		// si no se tiene un bloque bloqueado o hay overflow del contador de encabezados invalidos
            // invalid count overflow, lost block lock
            sh_count_next = 0;						// se reinicia el contador de bloques																																																																																																					
            sh_invalid_count_next = 0;					// se reinicia el contador de encabezados invalidos
            rx_block_lock_next = 1'b0;					// desactiva el bloqueo e indica que se ha perdido la sincronizacion

            // slip one bit
            serdes_rx_bitslip_next = 1'b1;				// activa el desplazamiento de bits para intentar recuperar la sincronizacion
            bitslip_count_next = BITSLIP_HIGH_CYCLES > 0 ? BITSLIP_HIGH_CYCLES-1 : 0;	// bitslip_count_next toma el valor de BITSLIP_HIGH_CYCLES-1 (si es distinto a cero) para indicar cuantos ciclos de bitslip alto se pueden realizar antes de que sea necesario realizar una correccion de desalineacion
        end else if (&sh_count_reg) begin				// si hay overflow del contador de bloques
            // valid count overflow, reset
            sh_count_next = 0;						// se reinician los contadores
            sh_invalid_count_next = 0;					
        end
    end
end

always @(posedge clk) begin				// en cada flanco positivo de clock se actualizan los registros y se verifica el estado de la señal de reinicio
    sh_count_reg <= sh_count_next;
    sh_invalid_count_reg <= sh_invalid_count_next;
    bitslip_count_reg <= bitslip_count_next;
    serdes_rx_bitslip_reg <= serdes_rx_bitslip_next;
    rx_block_lock_reg <= rx_block_lock_next;

    if (rst) begin
        sh_count_reg <= 6'd0;
        sh_invalid_count_reg <= 4'd0;
        bitslip_count_reg <= 0;
        serdes_rx_bitslip_reg <= 1'b0;
        rx_block_lock_reg <= 1'b0;
    end
end

endmodule

`resetall