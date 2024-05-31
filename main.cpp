
#include <boost/asio.hpp>
#include <boost/container/devector.hpp>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <iostream>
#include <string>

boost::container::devector<std::string> strings;

void print_strings(const boost::system::error_code& /*e*/) {
  for (const auto& a : strings) std::cout << a;
}

int main() {
  boost::asio::io_service io;
  const auto delay_seconds = 2;
  const auto delay = boost::posix_time::seconds(delay_seconds);

  std::cout << "Hello, world of async io!.\n Set of strings will be printed in " << delay_seconds << " seconds\n";

  strings.push_back("Hello, string 1!\n");
  strings.push_back("Hello, string 2!\n");

  boost::asio::deadline_timer t(io, delay);
  t.async_wait(&print_strings);

  io.run();

  return 0;
}
