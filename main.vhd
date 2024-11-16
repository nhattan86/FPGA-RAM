library ieee;
use ieee.std_logic_1164.all;

entity RAM is
    port (
        D: in std_logic_vector(3 downto 0);
        clk, rst: in std_logic;
        Q: out std_logic_vector(3 downto 0)
    );
end RAM;

architecture content of RAM is
    component D_flipflop
        port (
            D: in std_logic;
            clk, rst: in std_logic;
            Q: out std_logic
        );
    end component;

begin
    R0: D_flipflop port map (D(0), clk, rst, Q(0));
    R1: D_flipflop port map (D(1), clk, rst, Q(1));
    R2: D_flipflop port map (D(2), clk, rst, Q(2));
    R3: D_flipflop port map (D(3), clk, rst, Q(3));
end content;

library ieee;
use ieee.std_logic_1164.all;

entity D_flipflop is
    port (
        D: in std_logic;
        clk, rst: in std_logic;
        Q: out std_logic
    );
end D_flipflop;

architecture content of D_flipflop is
begin
    process(clk, rst)
    begin
        if rst = '0' then
            Q <= '0';
        elsif clk'event and clk = '1' then
            Q <= D;
        end if;
    end process;
end content;

      
