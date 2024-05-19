// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: AZXUNO
// Engineer: Miguel Angel Rodriguez Jodar
// 
// Create Date:    19:12:34 03/16/2017 
// Design Name:    
// Module Name:    ga 
// Project Name:   Gate array for ZXUNO
// Target Devices: ZXUNO Spartan 6
// Additional Comments: all rights reserved for now
//
//////////////////////////////////////////////////////////////////////////////////

module ga40010 (
  // clock y reset
  input wire ck16,
  input wire reset_n,
  // interface con la CPU
  input wire a15,
  input wire a14,
  input wire mreq_n,
  input wire iorq_n,
  input wire m1_n,
  input wire rd_n,
  input wire rfsh_n,  // no existe. Hay que inferirla en el TLD
  output wire phi_n,
  output reg ready,
  output reg int_n,
  input wire [7:0] d,
  // interface con el 6845
  input wire vsync,
  input wire hsync,
  input wire dispen,
  output reg cclk,
  // control para la glue logic
  output reg en244_n,
  output reg cpu_n,
  output reg romen_n,
  output reg ramrd_n,
  // interface para la DRAM
  output reg ras_n,
  output reg cas_n,
  output wire casad_n,
  output wire mwe_n,
  output reg[2:0] ram_bank,
  // salida de video
  output wire sync_n,    // necesita adaptacion a 5V
  output wire hsync_pal, // OJO! Esta señal no existe en la GA real
  output wire vsync_pal, // OJO! Esta señal no existe en la GA real
  output wire red,       // 
  output wire red_oe,    //
  output wire green,     // 1 o 0
  output wire green_oe,  // si vale 1, color sale afuera cono 5V o 0V. Si 0, HZ
  output wire blue,      //
  output wire blue_oe    //
  );

  reg [3:0] state = 4'b0000;
  reg mwe_n_interna = 1'b1;
  reg border_time = 1'b0;
  initial cclk = 1'b0;
  initial ready = 1'b0;
  initial ras_n = 1'b1;
  initial cas_n = 1'b1;  
  initial cpu_n = 1'b1;
  initial ramrd_n = 1'b1;
  initial en244_n = 1'b1;
  initial int_n = 1'b1;
  assign phi_n = state[1];  // aqui se define la velocidad del reloj de la CPU
  assign casad_n = ras_n; // comprobar, porque de momento son iguales

  // Algunas señales de uso interno útiles
  wire memread = (~mreq_n & ~rd_n);
  wire memwrite = (~mreq_n & rd_n & m1_n & rfsh_n);
  wire iowrite = (~iorq_n & m1_n);  // cualquier acceso a I/O lo toma como escritura
  wire intack = (~iorq_n & ~m1_n);  // acuse de recibo de interrupción enmascarable, para resetear contador de interrupciones
  wire [1:0] high_bits_address = {a15,a14};
  assign mwe_n = mwe_n_interna | ~memwrite;  // mwe_n baja sólo cuando le toque por el secuenciador, y además no haya una lectura activa

  // Registros del gate array
  reg upper_rom = 1'b0;  // 0=enable, 1=disable (C000-FFFF)
  reg lower_rom = 1'b0;  // 0=enable, 1=disable (0000-3FFF)
  reg [1:0] video_mode = 2'b00;
  reg [1:0] next_video_mode = 2'b00;
  reg [4:0] penr = 5'b00000;
  reg [4:0] inkr[0:15];
  reg [4:0] bordr = 5'd11;  // blanco
  integer i;
  initial begin
    for (i=0;i<16;i=i+1)
      inkr[i] = 5'b00000;
  end  

  // Actualizar registros del gate array
  parameter 
    PENR = 2'b00,
    INKR = 2'b01,
    RMR = 2'b10,
    MMR = 2'b11;

  // Ventana de acceso del GA a los datos. Señal para ver en iSIM
  reg habilitacion_escritura;
  always @* begin
    if (high_bits_address == 2'b01 && iowrite == 1'b1 && en244_n == 1'b0)
      habilitacion_escritura = 1'b1;
    else
      habilitacion_escritura = 1'b0;
  end

  always @(posedge ck16) begin
    if (reset_n == 1'b0) begin
      upper_rom <= 1'b0;
      lower_rom <= 1'b0;
      video_mode <= 2'b00;
      next_video_mode <= 2'b00;
      penr <= 5'b00000;
      ram_bank <= 3'b000;
    end
    else begin
      if (habilitacion_escritura) begin
        case (d[7:6])
          PENR: penr <= d[4:0];
          INKR: if (penr[4])
                  bordr <= d[4:0];
                else
                  inkr[penr[3:0]] <= d[4:0];
          RMR: {upper_rom, lower_rom, next_video_mode} <= d[3:0];
          MMR: ram_bank[2:0] <= d[2:0];
        endcase
      end
      if (hsync == 1'b1)  // se actualiza el modo de video en cada HSYNC
        video_mode <= next_video_mode;
    end
  end
  
  // el bit 4 de RMR no es un registro, sino una señal activa sólo durante 
  // la operación de E/S, así que la modelo como combinacional
  // queda por ver si sólo debería estar activa durante un ciclo de reloj
  // o durante todo el tiempo que dura el ciclo de E/S
  reg reset_interrupt;
  always @* begin
    if (habilitacion_escritura && d[7:6] == RMR)
      reset_interrupt = d[4];
    else
      reset_interrupt = 1'b0;
  end

  // Varias señales periódicas
  always @(posedge ck16) begin
    state <= state + 4'd1;
    if (state >= 4'd4 && state <= 4'd10 && iorq_n == 1'b0)
      en244_n <= 1'b0;
    else if (state == 4'd11)
      en244_n <= 1'b1;  // esto es como entiendo que se comporta /244EN. A ver si es así...
    case (state)
      4'd2 :
      begin
        ras_n <= 1'b1;
        cpu_n <= 1'b0;
      end
      4'd3 : 
      begin
        cclk <= 1'b0;
        cas_n <= 1'b1;
        border_time <= ~dispen;
      end
      4'd4 :
      begin
        ras_n <= 1'b0;
        ready <= 1'b1;
      end
      4'd5 : if (ramrd_n == 1'b0 || memwrite) cas_n <= 1'b0; // cas vuelve a bajar si la CPU hace acceso a memoria
      4'd6 : mwe_n_interna <= 1'b0;
      4'd8 : 
      begin
        ras_n <= 1'b1;
        ready <= 1'b0;
        cpu_n <= 1'b1;
      end
      4'd9 : 
      begin
        mwe_n_interna <= 1'b1;
        cas_n <= 1'b1; // por si bajó en el ciclo 5
      end
      4'd10: ras_n <= 1'b0;
      4'd14:
      begin
        cclk <= 1'b1;
        cas_n <= 1'b1;
      end
      4'd11,
      4'd15: cas_n <= 1'b0;
    endcase
  end

  // Señal ROMEN_N : salida de ROM habilitada
  always @* begin
    romen_n = 1'b1;
    if (high_bits_address == 2'b00 && lower_rom == 1'b0 && memread)
      romen_n = 1'b0;
    if (high_bits_address == 2'b11 && upper_rom == 1'b0 && memread)
      romen_n = 1'b0;
  end
  
  // Señal RAMRD_N
  always @(posedge ck16) begin
    if (memread && romen_n)
      ramrd_n <= 1'b0;
    else
      ramrd_n <= 1'b1;
  end
  
  // Interrupción enmascarable. http://cpctech.cpc-live.com/docs/ints.html  http://www.retroisle.com/amstrad/cpc/Technical/hardware_Interrupts.php
  reg [5:0] intcnt = 6'b000000;
  reg [1:0] vsync_count = 2'b11;
  reg hsync_prev = 1'b0;
  reg vsync_prev = 1'b0;
  reg intack_prev = 1'b0;
  
  always @(posedge ck16) begin
    hsync_prev <= hsync;
    vsync_prev <= vsync;
    intack_prev <= intack;
  end
  wire hsync_falling_edge = hsync_prev & ~hsync;
  wire vsync_rising_edge = ~vsync_prev & vsync;
  wire intack_falling_edge = intack_prev & ~intack;
  
  always @(posedge ck16) begin
    if (reset_n == 1'b0) begin
      vsync_count <= 2'b11;
    end
    else begin
      if (vsync_rising_edge == 1'b1)
        vsync_count <= 2'b00;
      else if (vsync_count != 2'b11 && hsync_falling_edge) begin
        vsync_count <= vsync_count + 2'b01;
      end
    end
  end
  
  always @(posedge ck16) begin
    if (reset_n == 1'b0) begin
      intcnt <= 6'd0;
      int_n <= 1'b1;
    end
    else begin
      if (intack_falling_edge == 1'b1) begin
        int_n <= 1'b1;
        intcnt <= {1'b0, intcnt[4:0]};
      end
      else if (reset_interrupt || (hsync_falling_edge && vsync_count == 2'b01) || (hsync_falling_edge && intcnt == 6'd51)) begin
        intcnt <= 6'd0;
        if (reset_interrupt /*|| (vsync_count == 2'b01 && intcnt[5] == 1'b0)*/)
          int_n <= 1'b1;
        else if (intcnt == 6'd51 || (vsync_count == 2'b01 && intcnt[5] == 1'b1))
          int_n <= 1'b0;
      end
      else if (hsync_falling_edge && intcnt != 6'd51) begin
        intcnt <= intcnt + 6'd1;
      end
    end
  end
        
  
//  always @(posedge ck16) begin
//    hsync_prev <= hsync;
//    intack_prev <= intack;
//    vsync_prev <= vsync;
//    if (vsync_prev == 1'b0 && vsync == 1'b1)  // comienza un VSync. Reseteamos contador para contar dos HSync desde este momento
//      vsync_count <= 2'b00;
//    if (hsync == 1'b0 && hsync_prev == 1'b1) begin // flanco de bajada de HSYNC            
//      intcnt <= intcnt + 6'd1;
//      if (vsync == 1'b0) begin  // si no es una interrupcion por VSync
//        if (intcnt == 6'd51) /* && int_n == 1'b1)*/ begin  // interrupción HSync
//          int_n <= 1'b0;
//          intcnt <= 6'b000000;
//        end
//      end
//      else begin  // si es una interrupción por VSync
//        if (vsync_count != 2'd2)
//          vsync_count <= vsync_count + 2'd1;  // contamos de 0 a 2 HSyncs y nos paramos
//        if (vsync_count == 2'd1) begin
//          intcnt <= 6'b000000;
//          if ((intcnt[5] == 1'b0 /*|| intcnt == 6'd51) && int_n == 1'b1*/))
//            int_n <= 1'b0;
//        end
//      end
//    end
//    if ((intack_prev == 1'b1 && intack == 1'b0/* && int_n == 1'b0*/) || reset_interrupt == 1'b1) begin
//      int_n <= 1'b1;        // cuando termina INTACK, se quita la interrupción y se resetea bit 5 de contador
//      if (reset_interrupt == 1'b1)
//        intcnt <= 6'b000000;
//      else
//        intcnt[5] <= 1'b0;
//    end
//  end  
  
  // Generación de pixeles en el GA que lee de DRAM
  reg [7:0] buffer_from_ram = 8'h00;
  reg [7:0] shiftreg = 8'h00;
  always @(posedge ck16) begin
    if (state == 4'd3 || state == 4'd11)
      shiftreg <= buffer_from_ram;
    else begin
      if (state == 4'd7 || state == 4'd15)
        shiftreg <= {shiftreg[6:0], 1'b0};
      else if (video_mode != 2'b00 && (state == 4'd5 || state == 4'd9 || state == 4'd13 || state == 4'd1))  // asi incluyo también el modo 3 sin proponermelo
        shiftreg <= {shiftreg[6:0], 1'b0};
      else if (video_mode == 2'b10)
        shiftreg <= {shiftreg[6:0], 1'b0};
    end      
    if (state == 4'd3 || state == 4'd15) begin   // dos lecturas cada 16 ciclos.
      buffer_from_ram <= d;
    end
  end  
  
  // Entrada de paleta que le corresponde al pixel actual
  reg [3:0] palentry;
  always @* begin
    case (video_mode)
      2'b00: palentry = {shiftreg[1], shiftreg[5], shiftreg[3], shiftreg[7]};      
      2'b10: palentry = {3'b000, shiftreg[7]};
      default: palentry = {2'b00, shiftreg[3], shiftreg[7]}; // esto cubre el modo indocumentado 3
    endcase
  end
  
  // Señal vblank. Vale 1 durante 26 scanlines tras el flanco de subida de VSYNC
  reg vblank;

  // Color cogido de la paleta
  wire [4:0] color;
  assign color = (border_time)? bordr : inkr[palentry];

  // Traduccion de color a RGB en 3 estados
  hwcolor_to_rgb traductor (
    .color(color),
    .blank(hsync | vblank),
    .r(red),
    .r_oe(red_oe),
    .g(green),
    .g_oe(green_oe),
    .b(blue),
    .b_oe(blue_oe)
  );

  // Generación de sincronismo compuesto
  reg [3:0] contcclk = 4'd0;
  always @(posedge ck16) begin
    if (hsync_prev == 1'b0 && hsync == 1'b1) begin // flanco de subida de HSYNC
      contcclk <= 4'd0;
    end
    else if (hsync == 1'b1 && state == 4'd3) begin // el estado 3 es cuando CCLK está a punto de bajar a 0
      contcclk <= contcclk + 4'd1;
    end
  end
  reg csync_h_n; // componente horizontal del sincronismo compuesto
  always @* begin
    if (hsync == 1'b1 && contcclk >= 4'd2 && contcclk <= 4'd5)
      csync_h_n = 1'b0;
    else
      csync_h_n = 1'b1;
  end

  reg [4:0] conthsyncs = 5'd31;
  always @(posedge ck16) begin
    if (vsync_rising_edge) begin // flanco de subida de VSYNC
      conthsyncs <= 5'd0;
    end
    else if (hsync_falling_edge && conthsyncs != 5'd31) begin // incrementamos el reloj en cada flanco negativo de HSYNC, durante un VSYNC
      conthsyncs <= conthsyncs + 5'd1;
    end
  end
  reg csync_v; // componente vertical del sincronismo compuesto
  always @* begin
    if (conthsyncs >= 5'd2 && conthsyncs <= 5'd5)
      csync_v = 1'b1;
    else
      csync_v = 1'b0;
    if (conthsyncs >= 5'd0 && conthsyncs <= 5'd25)
      vblank = 1'b1;
    else
      vblank = 1'b0;
  end
  
  assign sync_n = csync_h_n ^ csync_v;  // combinación de ambos sincronismos para obtener el sincronismo compuesto
  assign hsync_pal = csync_h_n;
  assign vsync_pal = ~csync_v;
endmodule

module hwcolor_to_rgb (
  input wire [4:0] color,
  input wire blank, // apagar pantalla cuando sea blanking
  output reg r,
  output reg r_oe,
  output reg g,
  output reg g_oe,
  output reg b,
  output reg b_oe
  );

  parameter
    L = 2'b01,
    M = 2'bx0,
    H = 2'b11;

  always @* begin
    if (blank)
      {r, r_oe, g, g_oe, b, b_oe} = {L,L,L};
    else begin
      case (color)
        5'd00: {r, r_oe, g, g_oe, b, b_oe} = {M,M,M};
        5'd01: {r, r_oe, g, g_oe, b, b_oe} = {M,M,M};
        5'd02: {r, r_oe, g, g_oe, b, b_oe} = {L,H,M};
        5'd03: {r, r_oe, g, g_oe, b, b_oe} = {H,H,M};
        5'd04: {r, r_oe, g, g_oe, b, b_oe} = {L,L,M};
        5'd05: {r, r_oe, g, g_oe, b, b_oe} = {H,L,M};
        5'd06: {r, r_oe, g, g_oe, b, b_oe} = {L,M,M};
        5'd07: {r, r_oe, g, g_oe, b, b_oe} = {H,M,M};
        5'd08: {r, r_oe, g, g_oe, b, b_oe} = {H,L,M};
        5'd09: {r, r_oe, g, g_oe, b, b_oe} = {H,H,M};
        5'd10: {r, r_oe, g, g_oe, b, b_oe} = {H,H,L};
        5'd11: {r, r_oe, g, g_oe, b, b_oe} = {H,H,H};
        5'd12: {r, r_oe, g, g_oe, b, b_oe} = {H,L,L};
        5'd13: {r, r_oe, g, g_oe, b, b_oe} = {H,L,H};
        5'd14: {r, r_oe, g, g_oe, b, b_oe} = {H,M,L};
        5'd15: {r, r_oe, g, g_oe, b, b_oe} = {H,M,H};
        5'd16: {r, r_oe, g, g_oe, b, b_oe} = {L,L,M};
        5'd17: {r, r_oe, g, g_oe, b, b_oe} = {L,H,M};
        5'd18: {r, r_oe, g, g_oe, b, b_oe} = {L,H,L};
        5'd19: {r, r_oe, g, g_oe, b, b_oe} = {L,H,H};
        5'd20: {r, r_oe, g, g_oe, b, b_oe} = {L,L,L};
        5'd21: {r, r_oe, g, g_oe, b, b_oe} = {L,L,H};
        5'd22: {r, r_oe, g, g_oe, b, b_oe} = {L,M,L};
        5'd23: {r, r_oe, g, g_oe, b, b_oe} = {L,M,H};
        5'd24: {r, r_oe, g, g_oe, b, b_oe} = {M,L,M};
        5'd25: {r, r_oe, g, g_oe, b, b_oe} = {M,H,M};
        5'd26: {r, r_oe, g, g_oe, b, b_oe} = {M,H,L};
        5'd27: {r, r_oe, g, g_oe, b, b_oe} = {M,H,H};
        5'd28: {r, r_oe, g, g_oe, b, b_oe} = {M,L,L};
        5'd29: {r, r_oe, g, g_oe, b, b_oe} = {M,L,H};
        5'd30: {r, r_oe, g, g_oe, b, b_oe} = {M,M,L};
        default: {r, r_oe, g, g_oe, b, b_oe} = {M,M,H};  // 5'd31 en realidad, pero pongo default para no inferir latches
      endcase
    end
  end
endmodule
