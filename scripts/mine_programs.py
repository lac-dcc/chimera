import credentials
import argparse
import glob
import os
import shutil

from subprocess import run
from github import Github, Auth


def copy_verilog_files(repo_name, repo_path, target_dir):
    for file in (file for result in os.walk(repo_path)
                 for file in glob.iglob(os.path.join(result[0], '*.v'))
                 if not os.path.islink(file)):
        split = file.split(os.sep)
        split = split[split.index(repo_name):]

        filename = os.path.join(target_dir, '_'.join(split))

        if len(filename) > os.pathconf('/', 'PC_NAME_MAX'):
            # If the file name is too long, it is shortened by taking only the
            # first three letters of each subdirectory
            filename = '_'.join([dir_name[:3] for dir_name in split[1:-1]])
            filename = os.path.join(target_dir,
                                    f'{split[0]}_{filename}_{split[-1]}')

        shutil.copy2(file, filename)


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('--clones_dir', type=str,
                        help='(%(type)s) directory to store repositories cloned from GitHub (default: "%(default)s")',
                        default='../database/cloned_repos')
    parser.add_argument('--clones_savefile', type=str,
                        help='(%(type)s) name of the file where the names of used repos are saved (default: "%(default)s")',
                        default='cloned_repos.txt')
    parser.add_argument('--target_dir', type=str,
                        help='directory to store mined Verilog programs (default: "%(default)s")',
                        default='../database')
    parser.add_argument('--access_token', type=str,
                        help='GitHub access token (by default, takes token from credentials.py)',
                        default=credentials.GITHUB_ACCESS_TOKEN)
    parser.add_argument('--max_programs', type=int,
                        help='maximum number of Verilog programs to be added to the target directory (default: %(default)s)',
                        default=50000)
    args = parser.parse_args()

    auth = Auth.Token(args.access_token)

    g = Github(auth=auth)

    os.makedirs(args.clones_dir, exist_ok=True)
    os.makedirs(args.target_dir, exist_ok=True)

    cloned_repos_savefile = os.path.join(args.clones_dir, args.clones_savefile)
    if os.path.exists(cloned_repos_savefile):
        with open(cloned_repos_savefile, 'r') as savefile:
            current_repos = set([line.strip()
                                for line in savefile.readlines()])
    else:
        current_repos = set()

    repos_search = g.search_repositories('language:Verilog', 'stars', 'desc')
    for repo in (repo for repo in repos_search if repo.name not in current_repos):
        run(['git', 'clone', repo.clone_url], cwd=args.clones_dir)

        print(f'Copying files from {repo.name}... ', end='')
        repo_path = os.path.join(args.clones_dir, repo.name)
        copy_verilog_files(repo.name, repo_path, args.target_dir)
        print('done\n')

        # Removes clone dir after using it
        shutil.rmtree(repo_path)

        num_programs = len(glob.glob(os.path.join(args.target_dir, '*.v')))
        print(f'Current number of Verilog programs: {num_programs}\n')

        with open(cloned_repos_savefile, 'a') as savefile:
            savefile.write(repo.name + '\n')

        if num_programs >= args.max_programs:
            break


if __name__ == '__main__':
    main()
