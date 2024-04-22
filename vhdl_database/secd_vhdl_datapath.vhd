library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith;
use work.secd_defs.all;
use work.secd_ram_defs.all;

entity datapath is
  port( clk         : in std_logic;
        -- phase selection signals from top-level fsm
        phi_read    : in std_logic;
        phi_alu     : in std_logic;
        phi_write   : in std_logic;
        -- select signals from microcode instructions
        read_sel    : in std_logic_vector(4 downto 0);
        alu_sel     : in std_logic_vector(4 downto 0);
        write_sel   : in std_logic_vector(4 downto 0);
        -- RAM interface
        ram_in      : in std_logic_vector(31 downto 0);
        ram_out     : out std_logic_vector(31 downto 0);
        ram_addr    : out std_logic_vector(13 downto 0);
        ram_read    : out std_logic;
        ram_write   : out std_logic;
        -- opcode and flags output to control unit for instruction dispatch
        opcode      : out std_logic_vector(8 downto 0);
        flags       : out flagsunit;
        state       : out std_logic_vector(1 downto 0)
        );
end datapath;

architecture datapath_arch of datapath is

  -- Registers
  signal data_bus : std_logic_vector(31 downto 0);

  signal mar      : std_logic_vector(13 downto 0) := (others => '0');
  signal s        : std_logic_vector(13 downto 0) := (others => '0');
  signal e        : std_logic_vector(13 downto 0) := (others => '0');
  signal c        : std_logic_vector(13 downto 0) := (others => '0');
  signal d        : std_logic_vector(13 downto 0) := (others => '0');
  signal x1       : std_logic_vector(27 downto 14) := (others => '0');
  signal x2       : std_logic_vector(13 downto 0) := (others => '0');
  signal car      : std_logic_vector(13 downto 0) := (others => '0');
  signal free     : std_logic_vector(13 downto 0) := (others => '0');
  signal parent   : std_logic_vector(13 downto 0) := (others => '0');
  signal root     : std_logic_vector(13 downto 0) := (others => '0');
  signal y1       : std_logic_vector(13 downto 0) := (others => '0');
  signal y2       : std_logic_vector(13 downto 0) := (others => '0');
  signal arg      : std_logic_vector(31 downto 0) := (others => '0');
  signal buf1     : std_logic_vector(31 downto 0) := (others => '0');
  signal buf2     : std_logic_vector(31 downto 0) := (others => '0');

  signal state_reg  : std_logic_vector(1 downto 0) := (others => '0');

  signal alu_out    : std_logic_vector(31 downto 0);
  signal mul_result : std_logic_vector(59 downto 0);

  begin

    datapath_process : process(clk, phi_read, phi_alu, phi_write)
    begin
      if falling_edge(clk) then
        if phi_read = '1' then
          data_bus(27 downto 0) <= (others => '0');
          case read_sel is
            -- Standard 14 bit registers
            when rs =>
              data_bus(13 downto 0) <= s;
            when re =>
              data_bus(13 downto 0) <= e;
            when rc =>
              data_bus(13 downto 0) <= c;
            when rd =>
              data_bus(13 downto 0) <= d;
            when rx1 =>
              data_bus(13 downto 0) <= x1;
            when rx2 =>
              data_bus(13 downto 0) <= x2;
            when rfree =>
              data_bus(31 downto 14) <= (others => '0'); -- clear high part for gc use
              data_bus(13 downto 0) <= free;
            when rparent =>
              data_bus(13 downto 0) <= parent;
            when rroot =>
              data_bus(13 downto 0) <= root;
            when ry1 =>
              data_bus(13 downto 0) <= y1;
            when ry2 =>
              data_bus(13 downto 0) <= y2;
              -- 32 Bit registers
            when rbuf1 =>
              data_bus <= buf1;
            when rbuf2 =>
              data_bus <= buf2;
            when rarg =>
              data_bus <= arg;
              -- Special registers
            when rcar =>
              data_bus(13 downto 0) <= car;
            when rmar =>
              data_bus(27 downto 14) <= (others => '0');
              data_bus(13 downto 0)  <= mar;
            when rnum =>
              data_bus(27 downto 14) <= (others => '0');
              data_bus(13 downto 0)  <= ieee.std_logic_arith.conv_std_logic_vector((RAM_SIZE - 1), 14);
            when rcons =>
              data_bus(27 downto 14) <= x1;
              data_bus(13 downto 0)  <= x2;
            when rnil =>
              data_bus(13 downto 0) <= "00000000000000";
            when rtrue =>
              data_bus(13 downto 0) <= "00000000000001";
            when rfalse =>
              data_bus(13 downto 0) <= "00000000000010";
            when rmem =>
              data_bus <= ram_in;
            when ralu =>
              null;
            when "00000" =>
              null;
            when others =>
              assert(0 = 1) report "unimplemented read_sel value";
          end case;

        elsif phi_alu = '1' then

          alu_out(31 downto 28) <= "0011";

          case alu_sel is

            when dec =>
              alu_out(27 downto 0) <= std_logic_vector(signed(arg(27 downto 0)) - 1);

            when add =>
              alu_out(27 downto 0) <= std_logic_vector(signed(data_bus(27 downto 0)) + signed(arg(27 downto 0)));

            when subx =>
              alu_out(27 downto 0) <= std_logic_vector(signed(data_bus(27 downto 0)) - signed(arg(27 downto 0)));

            when mul | div | remx =>
              mul_result <= std_logic_vector(signed(data_bus) * signed(arg(27 downto 0)));
              alu_out(27 downto 0) <= mul_result(27 downto 0);

            when setmark =>
              alu_out(31)           <= arg(31);
              alu_out(30)           <= '1';
              alu_out(29 downto 0)  <= arg(29 downto 0);

            when clearmark =>
              -- report "clear-mark";
              alu_out(31)           <= arg(31);
              alu_out(30)           <= '0';
              alu_out(29 downto 0)  <= arg(29 downto 0);

            when replcar =>
              assert(arg(29 downto 28) = "00") report "trying to replcar non-cons";
              alu_out(31 downto 28) <= arg(31 downto 28);
              alu_out(27 downto 14) <= y2;
              alu_out(13 downto 0)  <= arg(13 downto 0);

            when gcreverse =>
              -- report "gcreverse";
              assert(arg(29 downto 28) = "00") report "trying to gcreverse non-cons";
              buf2(31) <= '0';
              buf2(30) <= '1';
              buf2(29 downto 28) <= "00";
              buf2(27 downto 14) <= y2;               -- car(parent) := root
              buf2(13 downto 0) <= arg(27 downto 14); -- cdr(parent) := car(parent)
              root <= arg(13 downto 0);

            when gcreset =>
              -- report "gcreset";
              assert(arg(29 downto 28) = "00") report "trying to gcreset non-cons";
              buf2(31 downto 28) <= arg(31 downto 28);
              buf2(27 downto 14) <= arg(27 downto 14);
              buf2(13 downto 0) <= y1;
              root <= y2;
              parent <= arg(13 downto 0);

            when gcmark =>
              -- report "gcmark";
              assert(arg(29 downto 28) = "00") report "trying to gcmark non-cons";
              buf2(30) <= '1';
              buf2(31) <= '1';
              buf2(29 downto 28) <= "00"; -- must be cons
              buf2(27 downto 14) <= y1;
              buf2(13 downto 0) <= arg(13 downto 0);
              root <= arg(27 downto 14);
              parent <= y2;

            -- status register pseudo ops
            when running =>
              state_reg <= "00";

            when halted =>
              state_reg <= "01";

            when gc =>
              state_reg <= "10";

            when others =>
              report "Warning, unsupported ALU operation";
          end case;

          if read_sel = ralu then
            data_bus <= alu_out;
          end if;

        elsif phi_write = '1' then

          case write_sel is
            -- Standard 14 bit registers
            when ws =>
              s <= data_bus(13 downto 0);
            when we =>
              e <= data_bus(13 downto 0);
            when wc =>
              c <= data_bus(13 downto 0);
            when wd =>
              d <= data_bus(13 downto 0);
            when wx1 =>
              x1 <= data_bus(13 downto 0);
            when wx2 =>
              x2 <= data_bus(13 downto 0);
            when wfree =>
              free <= data_bus(13 downto 0);
            when wparent =>
              parent <= data_bus(13 downto 0);
            when wroot =>
              root <= data_bus(13 downto 0);
            when wy1 =>
              y1 <= data_bus(13 downto 0);
            when wy2 =>
              y2 <= data_bus(13 downto 0);
            -- 32 Bit registers
            when warg =>
              arg <= data_bus;
            -- Special registers
            when wcar =>
              car <= data_bus(27 downto 14);
            when wmar =>
              mar <= data_bus(13 downto 0);
            when bidir =>
              ram_out <= data_bus;
            -- ALU output capturing
            when wbuf1 =>
              buf1 <= alu_out;
            when wbuf2 =>
              buf2 <= alu_out;
            when "00000" =>
              null;
            when others =>
              assert(0 = 1) report "unimplemented write selector";
          end case;
        end if;
      end if;
    end process;

    gen_flags : process(data_bus, arg)
    begin
      -- set up flags

      flags <= (others => '0');

      if data_bus(29 downto 28) = cell_symbol or data_bus(29 downto 28) = cell_number then
        flags(atom)  <= '1';
      end if;
      if data_bus(27 downto 0) = "0000000000000000000000000000" then
        flags(zero) <= '1';
      end if;
      flags(mark) <= data_bus(30);
      flags(field) <= data_bus(31);
      if data_bus(13 downto 0) = nil_addr then
        flags(nil) <= '1';
      end if;
      if data_bus(27 downto 0) = arg(27 downto 0) then
        flags(eq) <= '1';
      end if;
      if data_bus(27 downto 0) <= arg(27 downto 0) then
        flags(leq) <= '1';
      end if;
      if unsigned(data_bus(13 downto 0)) = (RAM_SIZE - 1) then
        flags(num) <= '1';
      end if;

      -- Generate opcode for mi dispatch
      opcode <= arg(8 downto 0);
    end process;

    ram_rw_gen : process(clk, phi_write, read_sel, write_sel)
    begin
      if rising_edge(clk) then
        if phi_write = '1' then
          -- RAM access
          case write_sel is
            when wmar =>
              ram_read <= '1';
              ram_write <= '0';
            when bidir =>
              ram_write <= '1';
              ram_read <= '0';
            when others =>
              ram_read <= '0';
              ram_write <= '0';
          end case;
        else
          ram_read <= '0';
          ram_write <= '0';
        end if;
      end if;
    end process;

    state <= state_reg;
    ram_addr <= mar;

  end architecture;
