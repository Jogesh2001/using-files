----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2020 05:48:14 PM
-- Design Name: 
-- Module Name: test_mul - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_mul is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           C : out STD_LOGIC_VECTOR (5 downto 0));
end test_mul;

architecture Behavioral of test_mul is
component mul 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           C : out STD_LOGIC_VECTOR (5 downto 0));
end component ;
file STIM_IN : text;
 file STIM_OUT : text;
signal W_A  : std_logic_vector(3 downto 0);
signal W_B  : std_logic_vector(1 downto 0);
signal W_C  : std_logic_vector(5 downto 0);
begin
DUT: mul
port map (A =>W_A,
         B=>W_B,
         C=>W_C);
 process
           variable L_IN : line;
            variable L_OUT : line;
           variable CHAR : character;
           variable DATA_1: std_logic_vector(3 downto 0);
            variable DATA_2: std_logic_vector(1 downto 0);
           begin
           file_open(STIM_IN, "C:\Users\jogesh\OneDrive\Desktop\project gopal sir\project_4\project_4.srcs\sim_1\new\text_in.txt",  read_mode);
            file_open(STIM_OUT, "C:\Users\jogesh\OneDrive\Desktop\project gopal sir\project_4\project_4.srcs\sim_1\new\text_out.txt", write_mode);
           while not endfile(STIM_IN) loop
             readline(STIM_IN, L_IN);
             read(L_IN, DATA_1);
              read(L_IN, CHAR);
               read(L_IN, DATA_2);
                 W_A <= DATA_1;
                 W_B <= DATA_2;
                 wait for 60 ns;
                 write(L_OUT, W_C);
                writeline(STIM_OUT, L_OUT); 
             end loop;
             file_close(STIM_IN);
                 file_close(STIM_OUT);
           wait ;
         end process ;
end Behavioral;
