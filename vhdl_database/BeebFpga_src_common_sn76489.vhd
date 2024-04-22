library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity tone_generator is
  port
  (
    clk           : in std_logic;
    clk_div16_en  : in std_logic;
    reset         : in std_logic;

    freq          : in std_logic_vector(9 downto 0);

    audio_out     : out std_logic
  );
end entity tone_generator;

architecture SYN of tone_generator is

begin

  -- the datasheet suggests that the frequency register is loaded
  -- into a 10-bit counter and decremented until it hits 0
  -- however, this results in a half-period of FREQ+1!

  process (clk, reset)
    variable count  : std_logic_vector(9 downto 0);
    variable tone   : std_logic;
  begin
    if reset = '1' then
      count := (others => '0');
      tone := '0';
    elsif rising_edge(clk) then
      if clk_div16_en = '1' then
        if count = freq then
          tone := not tone;
          count := (others => '0');
        else
          count := count + 1;
        end if;
      end if;
    end if;
    -- assign output
    audio_out <= tone;
  end process;

end SYN;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity sn76489 is
  generic
  (
    AUDIO_RES   : natural := 16
  );
  port
  (
    clk         : in std_logic;
    clk_en      : in std_logic;
    reset       : in std_logic;

    d           : in std_logic_vector(0 to 7);    -- D0 is MSB!
    we_n        : in std_logic;
    ce_n        : in std_logic;

    audio_out   : out std_logic_vector(AUDIO_RES-1 downto 0)
  );
end entity sn76489;

architecture SYN of sn76489 is

  type reg_t is array (natural range <>) of std_logic_vector(9 downto 0);
  signal reg  : reg_t(0 to 7);
  constant T1_FREQ      : natural := 0;
  constant T1_ATTN      : natural := 1;
  constant T2_FREQ      : natural := 2;
  constant T2_ATTN      : natural := 3;
  constant T3_FREQ      : natural := 4;
  constant T3_ATTN      : natural := 5;
  constant NOISE_CTL    : natural := 6;
  constant NOISE_ATTN   : natural := 7;

  signal clk_div16_en   : std_logic;
  signal audio_d        : std_logic_vector(0 to 3);

  -- the channel used to control the noise shifter frequency
  alias noise_f_ref     : std_logic is audio_d(2);

  --signal shift_s        : std_logic;  -- debug only

  -- yes, a shared variable!
  -- - written in 1 process, read in another
  shared variable reg_a : integer range 0 to 7;

begin

  process (clk, reset)
    variable count : std_logic_vector(3 downto 0) := (others => '0');
  begin
    if reset = '1' then
      count := (others => '0');
    elsif rising_edge(clk) then
      clk_div16_en <= '0';
      if clk_en = '1' then
        if count = 0 then
          clk_div16_en <= '1';
        end if;
        count := count + 1;
      end if;
    end if;
  end process;

  -- NOTE: on the SN76489, D0 is the MSB

  -- register interface
  process (clk, reset)
  begin
    if reset = '1' then
      -- attenutation registers are the important bits
      reg <= (others => (others => '1'));
    elsif rising_edge(clk) then
      if clk_en = '1' then
          -- data is strobed in on WE_n
        if ce_n = '0' and we_n = '0' then
          if d(0) = '1' then
            reg_a := conv_integer(d(1 to 3));
            -- always latch high nibble into R(3:0)
            reg(reg_a)(3 downto 0) <= d(4 to 7);
          else
            case reg_a is
              when T1_FREQ | T2_FREQ | T3_FREQ =>
                reg(reg_a)(9 downto 4) <= d(2 to 7);
              when others =>
                -- apparently writing a 'data' byte to non-Freq registers
                -- does actually work!
                reg(reg_a)(3 downto 0) <= d(4 to 7);
            end case;
          end if; -- d(0) = 0/1
        end if; -- ce_n = 0 & we_n = 0
      end if;
    end if;
  end process;

  GEN_TONE_GENS : for i in 0 to 2 generate

    tone_inst : entity work.tone_generator
      port map
      (
        clk             => clk,
        clk_div16_en    => clk_div16_en,
        reset           => reset,

        freq            => reg(i*2),

        audio_out       => audio_d(i)
      );

  end generate GEN_TONE_GENS;

  -- noise generator
  process (clk, reset)
    variable noise_r        : std_logic_vector(14 downto 0);
    variable count          : std_logic_vector(6 downto 0);
    variable noise_f_ref_r  : std_logic;
    variable shift          : boolean;
  begin
    if reset = '1' then
      noise_r := (noise_r'left => '1', others => '0');
      count := (others => '0');
      shift := false;
    elsif rising_edge(clk) then
      shift := false;
      if clk_div16_en = '1' then
        case reg(NOISE_CTL)(1 downto 0) is
          when "00" =>
            shift := count(count'left-2 downto 0) = 0;
          when "01" =>
            shift := count(count'left-1 downto 0) = 0;
          when "10" =>
            shift := count(count'left downto 0) = 0;
          when others =>
            -- shift rate governed by reference tone output
            shift := noise_f_ref = '1' and noise_f_ref_r = '0';
        end case;
        if shift then
          -- for periodic noise, don't use bit 0 tap
          noise_r := (noise_r(1) xor (reg(NOISE_CTL)(2) and noise_r(0))) & noise_r(noise_r'left downto 1);
        end if;
        count := count + 1;
        noise_f_ref_r := noise_f_ref;
      end if;

      -- writing to the NOISE_CTL register reloads the noise shift register
      if clk_en = '1' then
        if ce_n = '0' and we_n = '0' and reg_a = NOISE_CTL then
          noise_r := (noise_r'left => '1', others => '0');
        end if;
      end if;

      --if shift then shift_s <= '1'; else shift_s <= '0'; end if; -- debug only
    end if;
    -- assign digital output
    audio_d(3) <= not noise_r(0);
  end process;

  BLK_ATTN_MIXER : block
    type scale_t is array (natural range <>) of std_logic_vector(13 downto 0);
    constant scale : scale_t(0 to 15) :=
      (
        -- fixed-point scaled by 2^14
         0 => "11111111111111",
         1 => "11001011010110", -- -2dB
         2 => "10100001100010", -- -4dB
         3 => "10000000010011", -- -6dB
         4 => "01100101111011", -- -8dB
         5 => "01010000111101", -- -10dB
         6 => "01000000010011", -- -12dB
         7 => "00110011000101", -- -14dB
         8 => "00101000100101", -- -16dB
         9 => "00100000001111", -- -18dB
        10 => "00011001100110", -- -20dB
        11 => "00010100010101", -- -22dB
        12 => "00010000001010", -- -24dB
        13 => "00001100110101", -- -26dB
        14 => "00001010001100", -- -28dB
        15 => "00000000000000"
      );
  begin
    process (audio_d, reg)
      type ch_t is array (natural range <>) of std_logic_vector(15 downto 0);
      variable ch           : ch_t(0 to 3);
      variable audio_out_v  : std_logic_vector(15 downto 0);
    begin
      GEN_ATTN : for i in 0 to 3 loop
        if audio_d(i) = '1' then
          ch(i) := "00" & scale(conv_integer(reg(i*2+1)(3 downto 0)));
        else
          ch(i) := (others => '0');
        end if;
      end loop GEN_ATTN;
      -- now mix them
      audio_out_v := ch(0) + ch(1) + ch(2) + ch(3);
      -- handle user-defined audio resolution
      audio_out <= audio_out_v(audio_out_v'left downto audio_out_v'left-(AUDIO_RES-1));
    end process;
  end block BLK_ATTN_MIXER;

end SYN;
