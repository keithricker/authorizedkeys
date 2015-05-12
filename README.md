# tutum/authorizedkeys

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Adds a user public SSH key to the host's `~/.ssh/authorized_keys` via docker container

## Usage

    docker run -v /root:/user -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" tutum/authorizedkeys

With multiple keys:

	docker run -v /root:/user -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa1.pub`,`cat ~/.ssh/id_rsa2.pub`" tutum/authorizedkeys

Adding the key to a specific user:

	docker run -v /home/myuser:/user -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" tutum/authorizedkeys


## Usage in Tutum

We recommend using this image in Tutum as follows:

	authorizedkeys:
	  image: tutum/authorizedkeys
	  deployment_strategy: every_node
	  autodestroy: always
	  environment:
	    - AUTHORIZED_KEYS=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjHJxGBGgPKfkPk6UDJB6ZK6COcGvJpVcXmptcRRN7qYE44Ei4KXLUGB6cgqkjFeEk2Z5HCSrC05NQgX1+blhAan+RfPtvuJzCaZPyVaJwezbspJi6UbjfV6wgJa8kNA819+ggDuKyjy7yA5KtJecxhKK5WfEbuwbDDVrl5ogQbm+Gj4ThK24rcjMoE3MSAcjj8oxIv0jg6jzzF55dOh2pKWkEo6gBZRrNlD+QQTdYRrmfu8vTGC8UYWPCGKEY5pvopF9kp24emM6zWio4RWOjIbC3nZrTyh5HgUXDN8bG/xeajKQAJBxtNI+/tP+cJDou73H9fK97MSD+pBETybON
	  volumes:
	    - /root:/user:rw
