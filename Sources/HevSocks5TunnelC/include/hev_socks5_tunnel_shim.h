int hev_socks5_tunnel_main_shim(const char *path, int fd);
int hev_socks5_tunnel_main_from_str_shim(const char *str, unsigned int len, int fd);
void hev_socks5_tunnel_quit_shim(void);
void hev_socks5_tunnel_stats_shim(int *tp, int *tb, int *rp, int *rb);
