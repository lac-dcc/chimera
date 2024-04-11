
#include <iomanip>
#include <iostream>
#include <stack>
#include <map>
#include <random>
#include <fstream>
#include <vector>
#include "lib/json.hpp"
#include "AST.h"
#include "Visitor.h"

using json = nlohmann::json;

/**
 * ler json
 * percorrer começando em source_text
 * definir pesos para cada possivel produção
 * 
*/

std::vector<std::string> break_rule_in_prods(const std::string& rule){

    std::istringstream iss(rule);
    std::string token;

    std::vector<std::string> result;

    while(std::getline(iss, token, ' ')){
        result.push_back(token);
    }

    return result;
}

int main(int argc, char** argv)
{
    if(argc < 2){
        std::cout << "Usage:\n" << argv[0] << " [path to json file]" << std::endl;
    }

    
    std::ifstream f(argv[1]);

    json data = json::parse(f);
    std::map<std::string, std::map<std::string, std::string>> map = data.get<std::map<std::string, std::map<std::string, std::string>>>();


    std::stack<json> stack;
    
    stack.push(map["source_text"]);
    

    std::random_device rd;
    std::mt19937 gen(rd());

    while(!stack.empty()){
        auto curr = stack.top();
        stack.pop();

        auto prods = break_rule_in_prods(curr);

        for (auto const& prod: prods){
            if(prod[0]== '\'' or prod[0] == '\"')
        }

        std::discrete_distribution<> d({40, 10, 10, 40});

        d(gen);

    }
    
    
    


    
}