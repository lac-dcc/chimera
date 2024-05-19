"""Mine HDL programs from GitHub

This script searches for the most popular repositories in GitHub for a given
Hardware Description Language and copies files from them until a certain
threshold to number of copied programs.

It uses the GitHub API to search for repositories, thus you must have a GitHub
personal access token in order to use it. After generating a token, store it in
a file called credentials.py.

In order to avoid cloning repositories that were already cloned before when
running multiple times, the script saves the names of all cloned repositories in
a savefile. If you delete the savefile or change its name, the script will clone
repositories that were already used.

Usage:
    mine_programs.py [-h] [--clones_dir CLONES_DIR]
                     [--clones_savefile CLONES_SAVEFILE]
                     [--target_dir TARGET_DIR] [--access_token ACCESS_TOKEN]
                     [--max_programs MAX_PROGRAMS]
                     {Verilog,SystemVerilog,VHDL}

Arguments:
    {Verilog,SystemVerilog,VHDL}
        (str) Language of the programs which will be mined.
    --clones_dir CLONES_DIR
        (str) directory to store repositories cloned from GitHub (default: "../database/cloned_repos")
    --clones_savefile CLONES_SAVEFILE
        (str) name of the file where the names of used repos are saved (default: "cloned_repos.txt")
    --target_dir TARGET_DIR
        (str) directory to store mined Verilog programs (default: "../database")
    --access_token ACCESS_TOKEN
        (str) GitHub access token (by default, takes token from credentials.py)
    --max_programs MAX_PROGRAMS
        (int) maximum number of Verilog programs to be added to the target directory (default: 50000)
    --time_delta TIME_DELTA
        (int) number of days for the time window used to search for repositories (default: 7)
    --date_savefile DATE_SAVEFILE
        (str) name of the file where the oldest searched time window is saved (default: "last_pushed_at")
    -h, --help
        show help message and exit
"""

import credentials
import argparse
import glob
import os
import re
import shutil
import datetime

from subprocess import run
from functools import reduce
from github import Github, Auth


def copy_verilog_files(repo, repo_path, target_dir, ext):
    for file in (file for result in os.walk(repo_path)
                 for file in glob.iglob(os.path.join(result[0], ext))
                 if os.path.isfile(file) and not os.path.islink(file)):
        split = file.split(os.sep)
        split = split[split.index(repo.name):]

        filename = os.path.join(target_dir, '_'.join(split))
        filename = re.sub(r'[ |$|&|#|\||"|\'|>|<|*|;|=|^|`|!|?]', '', filename)
        filename = re.sub(r'[(|)|\[|\]|{|}]', '_', filename)

        if len(filename) > os.pathconf('/', 'PC_NAME_MAX'):
            # If the file name is too long, it is shortened by taking only the
            # first three letters of each subdirectory
            filename = '_'.join([dir_name[:3] for dir_name in split[1:-1]])
            filename = os.path.join(target_dir,
                                    f'{split[0]}_{filename}_{split[-1]}')

        info_str = f'// This program was cloned from: {repo.html_url}\n\
// License: {repo.license.name}\n\n'.encode()
        with open(filename, 'ab') as dst:
            dst.write(info_str)

            with open(file, 'rb') as src:
                shutil.copyfileobj(src, dst)


def can_clone_repo(repo, current_repos) -> bool:
    # We filter out programs which don't have a license
    if repo.license is None or repo.license.name == 'Other':
        return False

    return repo.full_name not in current_repos


def get_num_programs(extensions, target_dir):
    return reduce(lambda prev, ext: prev + len(glob.glob(os.path.join(target_dir, ext))), extensions, 0)


def load_current_repos(cloned_repos_savefile):
    if os.path.exists(cloned_repos_savefile):
        with open(cloned_repos_savefile, 'r') as savefile:
            current_repos = set([line.strip()
                                for line in savefile.readlines()])
    else:
        current_repos = set()

    # We need to add the repo that contains the script, in order to avoid mining
    # from programs from itself
    result = run('git remote get-url origin', shell=True,
                 capture_output=True, encoding='utf-8')
    regex = re.search(r'git@github\.com:(.+?\/.+?)\.git',
                      result.stdout.strip())
    if regex:
        current_repos.add(regex.group(1))

    return current_repos


def load_end_date(date_savefile):
    if not os.path.exists(date_savefile):
        return datetime.date.today()

    with open(date_savefile, 'r') as savefile:
        return datetime.date.fromisoformat(savefile.readline().strip())


def mine_from_repos(repos_search, current_repos, cloned_repos_savefile, extensions, max_programs, clones_dir, target_dir, language):
    for repo in (repo for repo in repos_search if can_clone_repo(repo, current_repos)):
        run(['git', 'clone', repo.clone_url], cwd=clones_dir)

        print(f'Copying files from {repo.name}... ', end='', flush=True)
        repo_path = os.path.join(clones_dir, repo.name)
        for ext in extensions:
            copy_verilog_files(repo, repo_path, target_dir, ext)
        print('done\n')

        # Removes clone dir after using it
        shutil.rmtree(repo_path)

        num_programs = get_num_programs(extensions, target_dir)
        print(f'Current number of {language} programs: {num_programs}\n')

        with open(cloned_repos_savefile, 'a') as savefile:
            savefile.write(repo.full_name + '\n')
        current_repos.add(repo.full_name)

        if num_programs >= max_programs:
            return num_programs

    return get_num_programs(extensions, target_dir)


def main():
    extension_dict = {'Verilog': [
        '*.v'], 'SystemVerilog': ['*.sv'], 'VHDL': ['*.vhdl', '*.vhd']}

    parser = argparse.ArgumentParser()

    parser.add_argument('language', type=str,
                        choices=extension_dict.keys(),
                        help='(%(type)s) Language of the programs which will be mined.')
    parser.add_argument('--clones_dir', type=str,
                        help='(%(type)s) directory to store repositories cloned from GitHub (default: "%(default)s")',
                        default='../database/cloned_repos')
    parser.add_argument('--clones_savefile', type=str,
                        help='(%(type)s) name of the file where the names of used repos are saved (default: "%(default)s")',
                        default='cloned_repos')
    parser.add_argument('--target_dir', type=str,
                        help='(%(type)s) directory to store mined Verilog programs (default: "%(default)s")',
                        default='../database')
    parser.add_argument('--access_token', type=str,
                        help='(%(type)s) GitHub access token (by default, takes token from credentials.py)',
                        default=credentials.GITHUB_ACCESS_TOKEN)
    parser.add_argument('--max_programs', type=int,
                        help='(%(type)s) maximum number of Verilog programs to be added to the target directory (default: %(default)s)',
                        default=50000)
    parser.add_argument('--date_delta', type=int,
                        help='(%(type)s) number of days for the time window used to search for repositories (default: %(default)s)',
                        default=7)
    parser.add_argument('--date_savefile', type=str,
                        help='(%(type)s) name of the file where the oldest searched time window is saved (default: "%(default)s")',
                        default='last_pushed_at')
    args = parser.parse_args()

    auth = Auth.Token(args.access_token)

    g = Github(auth=auth, per_page=100)

    os.makedirs(args.clones_dir, exist_ok=True)
    os.makedirs(args.target_dir, exist_ok=True)

    cloned_repos_savefile = os.path.join(args.clones_dir, args.clones_savefile)
    current_repos = load_current_repos(cloned_repos_savefile)

    # First, attempt to mine from the most popular repos in all of GitHub
    repos_search = g.search_repositories('language:Verilog', 'stars', 'desc')
    num_programs = mine_from_repos(repos_search, current_repos, cloned_repos_savefile,
                                   extension_dict[args.language], args.max_programs, args.clones_dir, args.target_dir, args.language)

    date_savefile = os.path.join(args.clones_dir, args.date_savefile)
    end_date = load_end_date(date_savefile)
    start_date = end_date - datetime.timedelta(days=args.date_delta)

    while num_programs < args.max_programs:
        query = f'language:{args.language} pushed:{start_date.isoformat()}..{end_date.isoformat()}'
        repos_search = g.search_repositories(query, 'stars', 'desc')

        num_programs = mine_from_repos(repos_search, current_repos, cloned_repos_savefile,
                                       extension_dict[args.language], args.max_programs, args.clones_dir, args.target_dir, args.language)

        with open(date_savefile, 'w') as savefile:
            savefile.write(end_date.isoformat() + '\n')
        end_date = start_date - datetime.timedelta(days=1)
        start_date = end_date - datetime.timedelta(days=args.date_delta)


if __name__ == '__main__':
    main()

