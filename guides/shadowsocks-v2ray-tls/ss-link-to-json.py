import argparse
import base64
import json
from urllib.parse import urlparse, parse_qs


def main():
    parser = argparse.ArgumentParser(
        description='Convert a shadowsocks ss:// url to a json config '
        'file. The JSON file will be written to stdout. Only the '
        'format used by the Android client is supported at the moment.')

    parser.add_argument('url', help='The ss URL to convert.')
    parser.add_argument(
        '--local-port', '-P', type=int, default=1080, metavar='PORT',
        help='The local port number to use in the output config. '
        'Defaults to %(default)s.')
    parser.add_argument(
        '--local-addr', '-A', default='127.0.0.1', metavar='ADDR',
        help='The local address to use in the output config. '
        'Defaults to %(default)s.')

    args = parser.parse_args()

    url = urlparse(args.url)
    if url.scheme != 'ss':
        print('URL scheme is not ss')
        exit(1)

    qs = parse_qs(url.query)
    plugin_config = qs['plugin'][0]
    plugin, plugin_opts = plugin_config.split(';', 1)

    # The input url might not have padding. In order to prevent parse
    # errors, we add the maximum number of paddings (2) to the URL,
    # which will be safely ignored if not needed.
    params = base64.urlsafe_b64decode(url.username + '==').decode('utf-8')

    method, password = params.split(':', 1)

    print(json.dumps({
        'server': url.hostname,
        'mode': 'tcp_and_udp',
        'server_port': url.port or 443,
        'password': password,
        'method': method,
        'local_port': args.local_port,
        'local_address': args.local_addr,
        'plugin': plugin,
        'plugin_opts': plugin_opts,
    }, indent=4))


if __name__ == '__main__':
    main()

