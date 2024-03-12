import credentials
import os
import glob
import shutil
from subprocess import run
from github import Github, Auth

def copy_verilog_files(repo_path, target_dir):
    for file in (file for result in os.walk(repo_path)
                     for file in glob.iglob(os.path.join(result[0], '*.v'))
                     if not os.path.islink(file)):
        split = file.split('/')[1:]
        filename = os.path.join(target_dir, '_'.join(split))

        if len(filename) > 255:
            filename = '_'.join([dir_name[:3] for dir_name in split[1:-1]])
            filename = os.path.join(target_dir,
                                    f'{split[0]}_{filename}_{split[-1]}')

        shutil.copy2(file, filename)

def main():
    auth = Auth.Token(credentials.GITHUB_ACCESS_TOKEN)

    g = Github(auth=auth)

    clones_dir = '../database/cloned_repos'
    os.makedirs(clones_dir, exist_ok=True)

    target_dir = '../database'
    os.makedirs(target_dir, exist_ok=True)

    repos = g.search_repositories('language:Verilog', 'stars', 'desc')
    for repo in repos:
        repo_path = os.path.join(clones_dir, repo.name)
        if os.path.exists(repo_path):
            continue

        run(['git', 'clone', repo.clone_url], cwd=clones_dir)

        print(f'Copying files from {repo.name}... ', end='')
        copy_verilog_files(repo_path, target_dir)
        print('done\n')

        num_programs = len(glob.glob(os.path.join(target_dir, '*.v')))
        print(f'Current number of Verilog programs: {num_programs}\n')

        if num_programs >= 50000:
            break

if __name__ == '__main__':
    main()
