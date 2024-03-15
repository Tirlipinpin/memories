import Fastify from 'fastify'
import { User } from './model/User'
import { Memory } from './model/Memory'
const fastify = Fastify({
  logger: true
})

fastify.get('/user', function (request, reply) {
  const user: User = {
    firstName: 'Bona',
    lastName: 'Petty',
    id: '1'
  }
  reply.send(user)
})


fastify.get('/memories', function (request, reply) {
  const memories: Memory[] = [
    {
      date: new Date('2018-09-01'),
      place: "Namek",
      title: "Saiyan awakening",
      id: "1",
    },
    {
      date: new Date('2016-06-01'),
      place: "Tatooine",
      title: "Birth",
      id: "2",
    },
    {
      date: new Date('2013-03-01'),
      place: "Gotham City",
      title: "Fighting Evil",
      id: "3",
    },
    {
      date: new Date('2021-05-04'),
      place: "Jade Palace",
      title: "Became The Great Sage, Heaven's Equal",
      id: "4",
    },

  ]
  reply.send(memories)
})

fastify.listen({ port: 3000 }, function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  // Server is now listening on ${address}
})

