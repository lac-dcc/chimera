-- This is part of the HyperRAM Rx connections.
-- It is a general-purpose shallow (two-element) asynchronuous FIFO.
--
-- Created by Michael Jørgensen in 2023 (mjoergen.github.io/HyperRAM).

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

library xpm;
   use xpm.vcomponents.all;

entity hyperram_fifo is
   generic (
      G_DATA_SIZE : natural
   );
   port (
      src_clk_i   : in    std_logic;
      src_valid_i : in    std_logic;
      src_data_i  : in    std_logic_vector(G_DATA_SIZE - 1 downto 0);
      dst_clk_i   : in    std_logic;
      dst_valid_o : out   std_logic;
      dst_data_o  : out   std_logic_vector(G_DATA_SIZE - 1 downto 0)
   );
end entity hyperram_fifo;

architecture synthesis of hyperram_fifo is

   -- Input registers in source clock domain
   signal src_registers : std_logic_vector(2 * G_DATA_SIZE - 1 downto 0);

   -- Write pointer in source clock domain
   signal src_gray_wr : std_logic_vector(1 downto 0) := "00";

   -- This instructs Vivado to leave the write pointer literally "as is", instead of
   -- potentially making some FSM optimization. The reason is that we want the input of
   -- the CDC to be directly from registers, rather than there being any extra
   -- combinational logic.
   attribute fsm_encoding : string;
   attribute fsm_encoding of src_gray_wr : signal is "none";

   -- Input registers in destination clock domain
   signal dst_registers : std_logic_vector(2 * G_DATA_SIZE - 1 downto 0);

   -- Write pointer in destination clock domain
   signal dst_gray_wr : std_logic_vector(1 downto 0) := "00";

   -- Read pointer in destination clock domain
   signal dst_gray_rd : std_logic_vector(1 downto 0) := "00";

begin

   src_proc : process (src_clk_i)
   begin
      if rising_edge(src_clk_i) then
         if src_valid_i = '1' then

            case src_gray_wr is

               when "00" =>
                  src_gray_wr                             <= "01";
                  src_registers(G_DATA_SIZE - 1 downto 0) <= src_data_i;

               when "01" =>
                  src_gray_wr                                           <= "11";
                  src_registers(2 * G_DATA_SIZE - 1 downto G_DATA_SIZE) <= src_data_i;

               when "10" =>
                  src_gray_wr                                           <= "00";
                  src_registers(2 * G_DATA_SIZE - 1 downto G_DATA_SIZE) <= src_data_i;

               when "11" =>
                  src_gray_wr                             <= "10";
                  src_registers(G_DATA_SIZE - 1 downto 0) <= src_data_i;

               when others =>
                  null;

            end case;

         end if;
      end if;
   end process src_proc;

   xpm_cdc_array_single_ram_inst : component xpm_cdc_array_single
      generic map (
         DEST_SYNC_FF   => 2,
         INIT_SYNC_FF   => 0,
         SIM_ASSERT_CHK => 0,
         SRC_INPUT_REG  => 0,
         WIDTH          => 2 * G_DATA_SIZE
      )
      port map (
         src_clk  => '0',
         src_in   => src_registers,
         dest_clk => dst_clk_i,
         dest_out => dst_registers
      ); -- xpm_cdc_array_single_ram_inst

   -- Note that the write pointer is delayed one additional clock cycle (3) compared to
   -- that of the input registers (2). This is to account for any skew there may be in the
   -- Clock Domain Crossing. In short, we want to make sure that the input registers
   -- (src_registers) are updated no later than the write pointer (src_gray_wr).
   xpm_cdc_array_single_gray_wr_inst : component xpm_cdc_array_single
      generic map (
         DEST_SYNC_FF   => 3,
         INIT_SYNC_FF   => 0,
         SIM_ASSERT_CHK => 0,
         SRC_INPUT_REG  => 0,
         WIDTH          => 2
      )
      port map (
         src_clk  => '0',
         src_in   => src_gray_wr,
         dest_clk => dst_clk_i,
         dest_out => dst_gray_wr
      ); -- xpm_cdc_array_single_gray_wr_inst

   -- Forward data, one word at a time, as soon as the write pointer is different from
   -- the read pointer.
   dst_proc : process (dst_clk_i)
   begin
      if rising_edge(dst_clk_i) then
         dst_valid_o <= '0';

         if dst_gray_wr /= dst_gray_rd then

            case dst_gray_rd is

               when "00" =>
                  dst_data_o  <= dst_registers(G_DATA_SIZE - 1 downto 0);
                  dst_gray_rd <= "01";

               when "01" =>
                  dst_data_o  <= dst_registers(2 * G_DATA_SIZE - 1 downto G_DATA_SIZE);
                  dst_gray_rd <= "11";

               when "10" =>
                  dst_data_o  <= dst_registers(2 * G_DATA_SIZE - 1 downto G_DATA_SIZE);
                  dst_gray_rd <= "00";

               when "11" =>
                  dst_data_o  <= dst_registers(G_DATA_SIZE - 1 downto 0);
                  dst_gray_rd <= "10";

               when others =>
                  null;

            end case;

            dst_valid_o <= '1';
         end if;
      end if;
   end process dst_proc;

end architecture synthesis;

