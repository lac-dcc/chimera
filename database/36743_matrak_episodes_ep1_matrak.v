// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Processor Module

module matrak (
   input                clk_i,
   input                rst_i,
   input [31:0]         inst_i,     // Bellekten gelen buyruk
   output [31:0]        inst_addr_o // Belleğe giden buyruk adresi
);

   fetch f1 (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .pc_o(inst_addr_o)
   );

   // Boru hattı kaydedicisi bağlantıları
   wire [31:0] fd2d_inst;

   fd_regs fd1 (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .inst_f_i(inst_i),
      .inst_d_o(fd2d_inst)
   );

   // Çözme modülü bağlantıları
   wire c2d_regfile_wen;
   wire [2:0] c2d_imm_ext_sel;
   wire [31:0] w2d_result;
   wire [31:0] d2a_reg_a;
   wire [31:0] d2a_reg_b;
   wire [31:0] d2a_imm_ext;

   decode d1 (
      .clk_i(clk_i),
      .regfile_wen_i(c2d_regfile_wen),
      .imm_ext_sel_i(c2d_imm_ext_sel),
      .inst_i(fd2d_inst),
      .result_i(w2d_result),
      .reg_a_o(d2a_reg_a),
      .reg_b_o(d2a_reg_b),
      .imm_ext_o(d2a_imm_ext)
   );

   // ALU bağlantıları
   wire c2a_alu_sel;
   wire [3:0] c2a_alu_fun;
   wire [31:0] a2w_alu_out;

   alu a1 (
      .alu_sel_i(c2a_alu_sel),
      .alu_fun_i(c2a_alu_fun),
      .reg_a_i(d2a_reg_a),
      .reg_b_i(d2a_reg_b),
      .imm_ext_i(d2a_imm_ext),
      .alu_out_o(a2w_alu_out)
   );

   writeback w1 (
      .alu_out_i(a2w_alu_out),
      .result_o(w2d_result)
   );

   controller c1 (
      .inst_i(fd2d_inst),
      .regfile_wen_o(c2d_regfile_wen),
      .imm_ext_sel_o(c2d_imm_ext_sel),
      .alu_sel_o(c2a_alu_sel),
      .alu_fun_o(c2a_alu_fun)
   );

endmodule

module fetch (
   input                clk_i,
   input                rst_i,
   output reg [31:0]    pc_o
);

   always @(posedge clk_i, posedge rst_i) begin
      if (rst_i) begin // Sıfırlama sinyali geldiyse program sayacına başlangıç adresini ata
         pc_o <= 32'h0000_0000;
      end else begin // Saat sinyali geldiyse program sayacına 4 ekle
         pc_o <= pc_o + 4;
      end
   end

endmodule

module fd_regs (
   input                clk_i,
   input                rst_i,
   input [31:0]         inst_f_i, // Buyruk sinyali (bellekten geliyor)
   output reg [31:0]    inst_d_o  // Boru hattı kaydedicisinin çıkışı 
);

   always @(posedge clk_i, posedge rst_i) begin
      if (rst_i) begin
         inst_d_o <= 32'b0;
      end else begin
         inst_d_o <= inst_f_i;
      end
   end

endmodule

module decode (
   input                   clk_i,
   input                   regfile_wen_i, // Kaydedici dosyası yazma yetkilendirme
   input [2:0]             imm_ext_sel_i, // İvedi genişletici format seçimi
   input [31:0]            inst_i,        // Boru hattı kaydedicisinden gelen buyruk
   input [31:0]            result_i,      // Hedef kaydedicisine (rd) yazılacak değer 
   output [31:0]           reg_a_o,       // Birinci kaynak kaydedicisinin (rs1) değeri
   output [31:0]           reg_b_o,       // İkinci kaynak kaydedicisinin (rs2) değeri
   output reg [31:0]       imm_ext_o      // İvedi genişleticinin çıkışı
);

   // 32 bit genişlikte 32 adet kaydedicili kaydedici dosyası
   reg [31:0] regfile [31:0];

   // Kaydedici adreslerini buyruktan ayıkla
   wire [4:0] reg_a_addr      = inst_i[19:15];  // rs1 adres
   wire [4:0] reg_b_addr      = inst_i[24:20];  // rs2 adres
   wire [4:0] target_reg_addr = inst_i[11:7];   // rd adres

   // Kaydedici dosyasından oku
   assign reg_a_o = (reg_a_addr == 5'b0) ? 32'b0 : regfile[reg_a_addr]; // rs1 değeri
   assign reg_b_o = (reg_b_addr == 5'b0) ? 32'b0 : regfile[reg_b_addr]; // rs2 değeri

   // Kaydedici dosyasına yaz
   always @(posedge clk_i) begin
      if (regfile_wen_i) begin
         regfile[target_reg_addr] <= result_i;
      end
   end

   // İvedi genişletici
   always @(*) begin
      case (imm_ext_sel_i)
         3'b000   : imm_ext_o = {{20{inst_i[31]}}, inst_i[31:20]};
         default  : imm_ext_o = 32'b0; 
      endcase
   end

endmodule

module alu (
   input                      alu_sel_i,  // İkinci işlenenin seçim sinyali (rs2 veya imm)
   input [3:0]                alu_fun_i,  // İşlem seçim sinyali
   input [31:0]               reg_a_i,    // rs1 değeri
   input [31:0]               reg_b_i,    // rs2 değeri
   input [31:0]               imm_ext_i,  // imm değeri
   output reg [31:0]          alu_out_o   // Sonuç değeri
);

   // Birinci işlenen iki buyruk formatında da sabit.
   wire signed [31:0] alu_a = reg_a_i;
   // İkinci işlenen seçim sinyaline göre belirleniyor.
   wire signed [31:0] alu_b = alu_sel_i ? imm_ext_i : reg_b_i;

   always @(*) begin
      case (alu_fun_i)
         4'b0000  : alu_out_o = alu_a + alu_b;  // Toplama 
         4'b0001  : alu_out_o = alu_a - alu_b;  // Çıkarma
         4'b0010  : alu_out_o = alu_a & alu_b;  // VE
         4'b0011  : alu_out_o = alu_a ^ alu_b;  // XOR
         4'b0100  : alu_out_o = alu_a | alu_b;  // VEYA
         default  : alu_out_o = 32'bx;          // Geçersiz alu_fun_i sinyali
      endcase
   end

endmodule

module writeback (
   input  [31:0]              alu_out_i,
   output [31:0]              result_o
);

   assign result_o = alu_out_i;
   
endmodule

module controller (
   input [31:0]               inst_i,        // Boru hattı kaydedicisinden gelen buyruk
   output                     regfile_wen_o, // Kaydedici dosyası yazma yetkilendirme sinyali
   output [2:0]               imm_ext_sel_o, // İvedi genişletici format seçim sinyali
   output                     alu_sel_o,     // ALU ikinci işlenen seçim sinyali
   output reg [3:0]           alu_fun_o      // ALU işlem seçim sinyali
);

   // Buyruğun gerekli bölümleri ayıklanıyor.
   wire [6:0] opcode = inst_i[6:0];
   wire [2:0] funct3 = inst_i[14:12];
   wire [6:0] funct7 = inst_i[31:25];

   wire [1:0] alu_dec;

   reg [6:0] control_signals;
   assign {regfile_wen_o, imm_ext_sel_o, alu_sel_o, alu_dec} = control_signals;

   always @(*) begin
      case (opcode)  // Opcode'a göre kontrol sinyallerinin değerleri belirleniyor. 
         7'b0110011  : control_signals = 7'b1_xxx_0_11; // R-type buyruk
         7'b0010011  : control_signals = 7'b1_000_1_11; // I-type buyruk
         7'b0000000  : control_signals = 7'b0_000_0_00; // Sıfırlama durumu
         default     : control_signals = 7'bx_xxx_x_xx; // Geçersiz buyruk
      endcase
   end

   // Buyruk R-type ise ve funct7 değeri 0x20 ise çıkarma işlemi anlamına gelir.
   wire sub = opcode[5] & funct7[5];

   // ALU'da yapılacak işlem belirleniyor.
   always @(*) begin
      case (alu_dec)
         2'b11    : // R-type veya I-type
            case (funct3)
               3'b000   : // add-addi veya sub buyruğu
                  if (sub) begin
                     alu_fun_o = 4'b0001; // sub
                  end else begin
                     alu_fun_o = 4'b0000; // add, addi
                  end
               3'b100   : alu_fun_o = 4'b0011; // xor, xori
               3'b110   : alu_fun_o = 4'b0100; // or, ori
               3'b111   : alu_fun_o = 4'b0010; // and, andi
               default  : alu_fun_o = 4'b0000;
            endcase
         default  : alu_fun_o = 4'b0000; // Varsayılan işlemi toplama olarak belirledik.
      endcase
   end

endmodule
