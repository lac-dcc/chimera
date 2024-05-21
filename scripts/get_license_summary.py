import argparse
import credentials
import sys

from collections import defaultdict
from github import Github, Auth


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--clones_savefile', type=str,
                        help='(%(type)s) name of the file where the names of used repos are saved (default: "%(default)s")',
                        default='../database/cloned_repos/cloned_repos')
    parser.add_argument('--access_token', type=str,
                        help='(%(type)s) GitHub access token (by default, takes token from credentials.py)',
                        default=credentials.GITHUB_ACCESS_TOKEN)
    args = parser.parse_args()

    auth = Auth.Token(args.access_token)
    g = Github(auth=auth)

    license_count = defaultdict(int)
    with open(args.clones_savefile, 'r') as file:
        for i, repo in enumerate(file):
            print(f'{i} Running for {repo}', file=sys.stderr)
            license_count[g.get_repo(repo.strip()).license.name] += 1

    for license, count in sorted(license_count.items(), key=lambda item: item[1], reverse=True):
        print(f'{license},{count}')

if __name__ == '__main__':
    main()
