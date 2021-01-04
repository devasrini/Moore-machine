----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.01.2021 01:06:01
-- Design Name: 
-- Module Name: simulation_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simulation_tb is
--  Port ( );
end simulation_tb;

architecture Behavioral of simulation_tb is
component traffic_light_onestep is
Port (
rst : in std_logic;
clck : in std_logic;
r,g,y : out std_logic
 );
end component;
SIGNAL reset: std_logic := '0';
SIGNAL clock : std_logic := '0';
SIGNAL red,green,yellow: std_logic;
signal count : integer range 0 to 62 :=0;
begin
e1: traffic_light_onestep port map(rst =>reset,clck=>clock,r=>red,g=>green,y=>yellow);
p1: process
begin 
clock <= '1';
wait for 5 ns;
clock <= '0';
wait for 5 ns;
end process p1;
p2: process(clock)
begin
if(rising_edge(clock)) then
if(count <= 30) then
 reset <= '1';
 count <= count +1;
elsif ((count > 30) and (count < 60)) then
 reset <= '0';
 count <= count + 1;
else
  reset <= '1';
  count <= 0;
 end if;
 end if; 
end process p2;
end Behavioral;
