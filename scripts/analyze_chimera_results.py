import argparse
from subprocess import run
from datetime import datetime

def analyze_chimera():
    parser = argparse.ArgumentParser()

    parser.add_argument('--output_dir', type=str,
                        help='(%(type)s) directory to save the chimera programs (default: "%(default)s")',
                        default='../chimera_programs/')
    
    parser.add_argument('--chimera_executable', type=str,
                        help='local path to Chimera\'s executable ')
    parser.add_argument("--json_file", type=str, 
                      default="number_of_productions.json", 
                      help="Filepath to json file containing the productions count")
    parser.add_argument('--report_file', type=str,
                        help='file to save report of the program execution',
                        default='report_chimera.txt')
    
    parser.add_argument("-n", help="Number of times to run the tests", type=int)
    parser.add_argument('--verible_parser_executable', type=str,
                        help='local path to Verible\'s parser executable (verible-verilog-syntax)')
    parser.add_argument("--verbose",action="store_true",default=False)
    
    args = parser.parse_args()

    verible = args.verible_parser_executable
    chimera = args.chimera_executable
    json_file = args.json_file
    verbose = args.verbose
    report = args.report_file

    smallers = list()
    sizes = list()
    n = args.n
    invalids = 0

    for i in range(n):
        if verbose:
            print("Running Chimera. Iteration: ",i+1)
        p = run([chimera, json_file], capture_output=True, text=True)
        
        
        q = run([verible], input=p.stdout, text=True, capture_output=True)
        

        if q.returncode != 0:
            if verbose:
                print("Invalid program generated")
            invalids+=1
            size = len(p.stdout)
            smallers.append((size, p.stdout))
            sizes.append(size)
        if len(smallers) > 4:
            smallers.sort( key=lambda x: x[0])
            
            smallers = smallers[:3]
    
    if verbose:
        print("Saving files. Number of files:",len(smallers))
    for i in range(len(smallers)):
        with open(f"invalid_example_{i}","w", encoding="utf-8") as f:
            f.write(smallers[i][1])
    with open(report,"w",encoding="utf-8") as f:
        f.write("Report of execution of Chimera. Date:",datetime.today().strftime('%d/%m/%Y'),"\n")
        f.write(f"Number of programs generated: {n}\n")
        f.write(f"Number of invalid programs: {invalids}\n")
        f.write(f"Proportion:{invalids/n*100}")

        




    

if __name__ =="__main__":
    analyze_chimera()