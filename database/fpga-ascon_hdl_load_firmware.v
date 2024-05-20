// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module load_firmware #(
  /* parameter [31:0] memory_address = 32'h 0020_0000, */
  /* parameter [31:0] memory_address = 32'h 0010_0000, */
  parameter [31:0] memory_address = 32'h 0000_0000,
  parameter [31:0] serial_div     = 32'h 0200_0004,
  parameter [31:0] serial_data    = 32'h 0200_0008,
  parameter [31:0] gpio    = 32'h 0300_0000 ,
  parameter [19:0] firmware_size = 7312 - 4
) (
  input clk,
  input resetn,
  output reg mem_valid,
  input mem_ready,
  output reg [31:0]mem_addr,
  output reg [31:0]mem_wdata,
  output reg [3:0]mem_wstrb,
  input [31:0]mem_rdata,
  output reg fini
);


reg [4:0] etat;
reg [4:0] etat_retour_lecture_octet;
reg [4:0] etat_retour_lecture_word;
reg [4:0] etat_retour_orphelin;
reg [19:0] offset;
reg [7:0] compteur;
reg [1:0] byte_rank;
reg [31:0] word;
reg [2:0] hex_rank;

// Pour la conversion hex -> bin

wire [7:0] read_byte;
reg [15:0] hex_code;

hex_converter hex_converter(
  .clk (clk),
  .hex (hex_code),
  .output_byte (read_byte)
);

// Pour la conversion bin -> hex
wire [63:0] hex_notation;

byte_hex_converter  bhc1(
  .clk(clk),
  .hex(hex_notation[63:48]),
  .input_byte(word[31:24])
);
byte_hex_converter  bhc2(
  .clk(clk),
  .hex(hex_notation[47:32]),
  .input_byte(word[23:16])
);
byte_hex_converter  bhc3(
  .clk(clk),
  .hex(hex_notation[31:16]),
  .input_byte(word[15:8])
);
byte_hex_converter  bhc4(
  .clk(clk),
  .hex(hex_notation[15:0]),
  .input_byte(word[7:0])
);

parameter CONFIG_UART = 0;
parameter WRITE_BYTE = 1;
parameter REPEAT_PROMPT = 2;
parameter READ_FIRST_BYTE = 3;
parameter IDLE = 4;
parameter READ_SECOND_BYTE = 5;
parameter ECHO_FIRST_BYTE = 6;
parameter ECHO_SECOND_BYTE = 7;
parameter WRITE_MEMORY = 8;
parameter END = 9;
parameter REPEAT_READ_INIT = 10;
parameter REPEAT_READ_CONTINUE = 11;
parameter REPEAT_READ_FIRMWARE_INIT = 12;
parameter REPEAT_READ_FIRMWARE_CONTINUE = 13;
parameter REPEAT_DUMP_INIT = 14;
parameter REPEAT_DUMP_CONTINUE = 15;
parameter READ_MEMORY = 16;
parameter WRITE_HEX = 17;
parameter REPEAT_WRITE_SERIAL_HEX_INIT = 18;
parameter REPEAT_WRITE_SERIAL_HEX_CONTINUE = 19;
parameter TURN_ON_LED = 20;
parameter TURN_OFF_LED = 21;
parameter WRITE_NEWLINE = 22;

always @(posedge clk) begin
  if (!resetn) begin
    etat <= CONFIG_UART;
    offset <= 0;
    fini <= 0;
    mem_valid <= 0;
    mem_wstrb <= 0;
    compteur <= 0;
    byte_rank <= 3;
  end
  else 
  begin
    case(etat)
      CONFIG_UART: begin
        // configuration du port série
        mem_addr <= serial_div;
        mem_valid <= 1;
        mem_wstrb <= 1;
        /* mem_wdata <= 32'h 0000_0068; // la valeur 104 */
        /* mem_wdata <= 32'h 0000_0364; // la valeur 868 */
        mem_wdata <= 32'h 0000_008a; // la valeur 139 - 1 = 138 
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          /* etat <= WRITE_BYTE; */
          etat <= TURN_ON_LED;
        end
      end
      TURN_ON_LED: begin
        mem_addr <= gpio;
        mem_valid <= 1;
        mem_wstrb <= 4'b 0001;
        mem_wdata <= 8'h FF;
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          etat <= WRITE_BYTE;
        end
      end
      WRITE_BYTE: begin
        // Ecriture sur le port série
        mem_addr <= serial_data;
        mem_valid <= 1;
        mem_wstrb <= 1;
        /* mem_wdata <= 32'h 0000_003e; // Ecrire '>' */
        mem_wdata <= 32'h 0000_000a; // Ecrire '>'
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          etat <= REPEAT_PROMPT;
        end
      end
      REPEAT_PROMPT: begin
        compteur <= compteur + 1;
        if (compteur > 3) begin
          etat <= REPEAT_READ_FIRMWARE_INIT;
        end
        else
          etat <= WRITE_BYTE;
      end
      REPEAT_READ_FIRMWARE_INIT: begin
        offset <= 0;
        /* etat_retour_lecture_word <= REPEAT_READ_FIRMWARE_CONTINUE; */
        etat <= REPEAT_READ_INIT;
      end
      REPEAT_READ_FIRMWARE_CONTINUE: begin
        offset <= offset + 4;
        if (offset == firmware_size)
          etat <= REPEAT_DUMP_INIT;
        else begin 
          etat <= REPEAT_READ_INIT;
        end
      end
      REPEAT_READ_INIT: begin
        /* etat_retour_lecture_octet <= REPEAT_READ_CONTINUE; */
        byte_rank <= 3;
        etat <= READ_FIRST_BYTE;
      end
      REPEAT_READ_CONTINUE: begin
        case (byte_rank)
          3: word[31:24] <= read_byte;
          2: word[23:16] <= read_byte;
          1: word[15:8] <= read_byte;
          0: word[7:0] <= read_byte;
        endcase
        byte_rank <= byte_rank-1;
        if (byte_rank == 0)
          etat <= WRITE_MEMORY;
        else
          etat <= READ_FIRST_BYTE;
      end
      READ_FIRST_BYTE: begin
        // Lecture octet sur le port série
        mem_addr <= serial_data;
        mem_valid <= 1;
        mem_wstrb <= 0;
        /* ledr <= 0; */
        if (mem_ready && (mem_rdata != ~0)) begin
          hex_code[15:8] <= mem_rdata[7:0];
          mem_valid <= 0;
          mem_wstrb <= 0;
          etat <= ECHO_FIRST_BYTE;
        end
      end
      /* IDLE: begin */
      /*   mem_valid <= 0; */
      /*   mem_wstrb <= 0; */
      /*   etat <= 8; */
      /* end */
      ECHO_FIRST_BYTE: begin
        // Echo
        mem_addr <= serial_data;
        mem_valid <= 1;
        mem_wstrb <= 4'b 0001;
        mem_wdata[7:0] <= hex_code[15:8];
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          etat <= READ_SECOND_BYTE;
        end
      end
      /* 9: begin */
      /*   mem_valid <= 0; */
      /*   mem_wstrb <= 0; */
      /*   etat <= 3; */
      /* end */
      READ_SECOND_BYTE: begin
        // Lecture octet sur le port série
        mem_addr <= serial_data;
        mem_valid <= 1;
        mem_wstrb <= 0;
        /* ledg <= 0; */
        if (mem_ready && (mem_rdata != ~0)) begin
          hex_code[7:0] <= mem_rdata[7:0];
          etat <= ECHO_SECOND_BYTE;
          mem_valid <= 0;
          mem_wstrb <= 0;
        end
      end
      ECHO_SECOND_BYTE: begin
        // Echo
        mem_addr <= serial_data;
        mem_valid <= 1;
        mem_wstrb <= 4'b 0001;
        mem_wdata[7:0] <= hex_code[7:0];
        if (mem_ready) begin
          /* etat <= etat_retour_lecture_octet; */
          etat <= REPEAT_READ_CONTINUE;
          mem_valid <= 0;
          mem_wstrb <= 0;
        end
      end
      WRITE_MEMORY: begin
        // Ecriture dans la mémoire
        mem_addr <= { memory_address[31:20], offset };
        mem_valid <= 1;
        mem_wstrb <= 4'b 1111;
        /* mem_wdata <= 32'h deadbeef; */
        /* mem_wdata <= {24'b 0,read_byte}; */
        mem_wdata <= word;
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          /* etat <= etat_retour_lecture_word; */
          etat <= REPEAT_READ_FIRMWARE_CONTINUE;
        end
      end
      REPEAT_DUMP_INIT: begin
        offset <= 0;
        /* etat <= READ_MEMORY; */
        etat_retour_orphelin <= READ_MEMORY;
        etat <= WRITE_NEWLINE;
      end
      REPEAT_DUMP_CONTINUE: begin
        offset <= offset + 4;
        if (offset == firmware_size)
          /* etat <= END; */
          etat <= TURN_OFF_LED;
        else begin 
          etat <= READ_MEMORY;
        end
      end
      READ_MEMORY: begin
        mem_addr <= {memory_address[31:20], offset};
        mem_valid <= 1;
        if (mem_ready)
        begin
          word <= mem_rdata;
          etat <= REPEAT_WRITE_SERIAL_HEX_INIT;
          mem_valid <= 0;
        end
      end
      REPEAT_WRITE_SERIAL_HEX_INIT: begin
        mem_addr <= serial_data;
        hex_rank <= 0;
        etat <= WRITE_HEX;
      end
      REPEAT_WRITE_SERIAL_HEX_CONTINUE: begin
        hex_rank <= hex_rank + 1;
        if (hex_rank == 7) begin
          etat <= REPEAT_DUMP_CONTINUE;
        end
        else begin
          etat <= WRITE_HEX;
        end
      end

      WRITE_HEX: begin 
        mem_valid <= 1;
        mem_wstrb <= 4'b 0001;
        case(hex_rank)
          0: mem_wdata[7:0] <= hex_notation[63:56];
          1: mem_wdata[7:0] <= hex_notation[55:48];
          2: mem_wdata[7:0] <= hex_notation[47:40];
          3: mem_wdata[7:0] <= hex_notation[39:32];
          4: mem_wdata[7:0] <= hex_notation[31:24];
          5: mem_wdata[7:0] <= hex_notation[23:16];
          6: mem_wdata[7:0] <= hex_notation[15:8];
          7: mem_wdata[7:0] <= hex_notation[7:0];
        endcase
        if (mem_ready) begin
          etat <= REPEAT_WRITE_SERIAL_HEX_CONTINUE;
          mem_valid <= 0;
          mem_wstrb <= 0;
        end
      end

      TURN_OFF_LED: begin
        mem_addr <= gpio;
        mem_valid <= 1;
        mem_wstrb <= 4'b 1111;
        mem_wdata <= 32'h 0;
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          etat <= END;
        end
      end

    END: begin
      fini <= 1;
    end
    default:
      etat <= CONFIG_UART;
    // Etats orphelins
      WRITE_NEWLINE: begin
        // Ecriture sur le port série
        mem_addr <= serial_data;
        mem_valid <= 1;
        mem_wstrb <= 1;
        mem_wdata <= 32'h 0000_000a; // Ecrire '\n'
        if (mem_ready) begin
          mem_valid <= 0;
          mem_wstrb <= 0;
          etat <= etat_retour_orphelin; 
        end
      end
  endcase
end
end

endmodule
